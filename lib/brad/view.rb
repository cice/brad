module Brad
  module View
    extend ActiveSupport::Concern
    
    autoload :LayoutHelpers, 'brad/view/layout_helpers'
    
    included do
      include LayoutHelpers
    end
  end
end