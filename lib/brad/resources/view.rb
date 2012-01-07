module Brad::Resources::View
  extend ActiveSupport::Concern
  
  autoload :FormBuilders,   'brad/resources/view/form_builders'
  autoload :FormHelpers,    'brad/resources/view/form_helpers'
  
  autoload :TableBuilders,  'brad/resources/view/table_builders'
  autoload :TableHelpers,   'brad/resources/view/table_helpers'
  
  included do
    include Brad::View
    include FormHelpers
    include TableHelpers
  end
end