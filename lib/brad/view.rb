module Brad
  module View
    extend ActiveSupport::Concern
  
    autoload :BuilderTools,       'brad/view/builder_tools'
    
    autoload :LayoutHelpers,      'brad/view/layout_helpers'
    autoload :NavigationHelpers,  'brad/view/navigation_helpers'
    
    included do
      include LayoutHelpers
      include NavigationHelpers
    end
  end
end