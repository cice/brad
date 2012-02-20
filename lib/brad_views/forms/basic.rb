module BradViews::Forms
  class Basic < ActionView::Helpers::FormBuilder
    attr_accessor :snippets

    LABELED_CONTROLS = field_helpers - %w(label check_box radio_button fields_for hidden_field)
    BUTTON_TYPES = %w(primary info success warning danger inverse)

    def initialize *args, &block
      super

      @snippets = Snippets.new @template
    end

    def help content
      snippets.help_inline content
    end

    def labeled_control label_html, control_html
      label_html + control_html
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
      size = options.delete :size
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
        def labeled_#{control} method, options = {}
          label_html = label method
          control_html = plain_#{control} method, options

          labeled_control label_html, control_html
        end
        alias_method :#{control}, :labeled_#{control}
      RUBY
    end
  end
end
