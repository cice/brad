module Brad::Resources::View
  extend ActiveSupport::Concern
  
  autoload :BuilderTools, 'brad/resources/view/builder_tools'
  
  autoload :FormBuilders, 'brad/resources/view/form_builders'
  autoload :FormHelpers, 'brad/resources/view/form_helpers'
  
  autoload :TableBuilders, 'brad/resources/view/table_builders'
  autoload :TableHelpers, 'brad/resources/view/table_helpers'
  
  autoload :LayoutHelpers, 'brad/resources/view/layout_helpers'
  
  included do
    include FormHelpers
    include TableHelpers
    include LayoutHelpers
  end
end