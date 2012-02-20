module BradViews::Forms
  module Helper
    def form_for record, options = {}, &block
      options = form_options_merge_class options, 'form-vertical'
      options[:builder] ||= BradViews::Forms::Basic

      super record, options, &block
    end

    def horizontal_form_for record, options = {}, &block
      options[:builder] = BradViews::Forms::Horizontal

      form_for record, options, &block
    end

    def search_form_for record, options = {}, &block
      options[:builder] = BradViews::Forms::Search

      form_for record, options, &block
    end

    protected
    def form_options_merge_class options, clazz
      options = options.dup
      html_options = (options[:html] || {}).to_tag_options.merge! :class => clazz
      options[:html] = html_options

      options
    end
  end
end
