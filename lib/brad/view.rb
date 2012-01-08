module Brad
  module View
    extend ActiveSupport::Concern
  
    autoload :BuilderTools,       'brad/view/builder_tools'
    
    autoload :LayoutHelpers,      'brad/view/layout_helpers'
    autoload :NavigationHelpers,  'brad/view/navigation_helpers'
    autoload :AlertHelpers,       'brad/view/alert_helpers'
    
    included do
      include LayoutHelpers
      include NavigationHelpers
      include AlertHelpers
    end
  end
end
