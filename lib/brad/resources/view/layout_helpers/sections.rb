module Brad::Resources::View::LayoutHelpers
  module Sections
    def section h1 = nil, small = nil
      content_tag :section do
        if h1
          concat content_tag(:div, :class => 'page-header') {
            concat content_tag(:h1) {
              concat h1
              small && concat(content_tag(:small, small))
            }
          }
        end
        
        yield
      end
    end
  end
end