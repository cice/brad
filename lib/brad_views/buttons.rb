module BradViews
  module Buttons
    def btn_to *args, &block
      html_options = args.extract_tag_options!
      html_options.merge! :class => 'btn'
      html_options.merge! :class => "btn-#{html_options[:type]}" if html_options[:type]

      args << html_options

      link_to *args, &block
    end
  end
end
