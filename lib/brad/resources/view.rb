module Brad::Resources::View
  extend ActiveSupport::Concern
  
  autoload :FormBuilders, 'brad/resources/view/form_builders'
  autoload :FormHelpers, 'brad/resources/view/form_helpers'
  
  included do
    include FormHelpers
  end
end