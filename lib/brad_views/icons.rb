module BradViews
  module Icons
    def icon type, *args
      options = args.extract_tag_options!.merge! :class => "icon-#{type}"
      label = args.first

      content_tag(:i, '', options) + label.to_s
    end
  end
end
