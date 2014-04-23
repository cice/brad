require 'action_view'

module BradViews::Forms
  class Basic < ActionView::Helpers::FormBuilder
    attr_accessor :snippets

    LABELED_CONTROLS = field_helpers.map(&:to_s) - %w(label check_box radio_button fields_for hidden_field) + %w(date_select datetime_select collection_select)
    BUTTON_TYPES = BradViews::Buttons::BUTTON_TYPES
    ERROR_SEPARATOR = ', '

    def initialize *args
      super

      @snippets = Snippets.new @template
    end

    def help content
      snippets.help_inline content
    end

    def labeled_control control, method, options = {}, *args
      label_html = options[:label] || label(method)
      control_html = send "plain_#{control}", method, options, *args

      label_html + control_html + error_help_for(method)
    end

    def has_errors? method
      @object.errors[method].present?
    end

    def errors_for method
      @object.errors[method].join ERROR_SEPARATOR
    end

    def error_help_for method
      return '' unless has_errors?(method)

      help errors_for method
    end

    unless method_defined?(:button)
      def button(value=nil, options={})
        value, options = nil, value if value.is_a?(Hash)
        value ||= submit_default_value
        @template.button_tag(value, options)
      end
    end

    alias_method :plain_button, :button
    def typed_button type, value = nil, options = {}
      value, options = nil, value if value.is_a?(Hash)
      value ||= submit_default_value
      html_class = "btn"
      html_class += " btn-#{type}" if type
      options = options.to_tag_options.merge! :class => html_class

      plain_button value, options
    end

    alias_method :plain_submit, :submit
    def submit value = nil, options = {}
      options = options.to_tag_options
      size = options.delete(:size) || @_preset_options.try(:[], :size)
      options.merge! :class => "btn-#{size}" if size

      typed_button nil, value, options
    end
    alias_method :button, :submit

    alias_method :plain_check_box, :check_box
    def check_box method, options = {}, checked_value = "1", unchecked_value = "0"
      @template.content_tag :label, :class => 'checkbox' do
        @template.concat super
      end
    end

    def inline_check_box method, options = {}, checked_value = "1", unchecked_value = "0"
      @template.content_tag :label, :class => 'checkbox inline' do
        @template.concat plain_check_box(method, options, checked_value, unchecked_value)
      end
    end

    def actions options = {}, &block
      @_preset_options = options
      @template.content_tag :div, :class => 'form-actions', &block
    ensure
      @_preset_options = nil
    end

    BUTTON_TYPES.each do |button_type|
      class_eval <<-RUBY
        def #{button_type}_btn value = nil, options = {}
          typed_button "#{button_type}", value, options = {}
        end
      RUBY
    end

    LABELED_CONTROLS.each do |control|
      class_eval <<-RUBY, __FILE__, __LINE__
        alias_method :plain_#{control}, :#{control}
        def labeled_#{control} method, options = {}, *args
          labeled_control "#{control}", method, options, *args
        end
        alias_method :#{control}, :labeled_#{control}
      RUBY
    end
  end
end
