module BradViews
  module Buttons
    def btn_to *args, &block
      html_options = args.extract_tag_options!
      html_options.merge! :class => 'btn'
      html_options.merge! :class => "btn-#{html_options[:type]}" if html_options[:type]

      args << html_options

      link_to *args, &block
    end

    def btn_toolbar options = {}, &block
      options = options.to_tag_options.merge! :class => 'btn-toolbar'

      content_tag :div, options, &block
    end

    def btn_group options = {}, &block
      options = options.to_tag_options.merge! :class => 'btn-group'

      content_tag :div, options, &block
    end
  end
end
