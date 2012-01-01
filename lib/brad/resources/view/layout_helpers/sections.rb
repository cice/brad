module Brad::Resources::View::LayoutHelpers
  module Sections
    def section *args
      options = args.extract_options!
      h1, small = args
      
      content_tag :section, options do
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