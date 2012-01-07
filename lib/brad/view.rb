module Brad
  module View
    extend ActiveSupport::Concern
  
    autoload :BuilderTools,   'brad/view/builder_tools'
    
    autoload :LayoutHelpers,  'brad/view/layout_helpers'
    
    included do
      include LayoutHelpers
    end
  end
end