module BradViews::Forms
  class Basic < ActionView::Helpers::FormBuilder
    attr_accessor :snippets

    LABELED_CONTROLS = field_helpers - %w(label check_box radio_button fields_for hidden_field)

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

    LABELED_CONTROLS.each do |control|
      class_eval <<-RUBY, __FILE__, __LINE__
        alias_method :plain_#{control}, :#{control}
        def #{control} method, options = {}
          label_html = label method
          control_html = plain_#{control} method, options

          labeled_control label_html, control_html
        end
      RUBY
    end
  end
end
