module BradViews
  module Icons
    def icon type, label = nil
      content_tag(:i, '', :class => "icon-#{type}") + label.to_s
    end
  end
end
