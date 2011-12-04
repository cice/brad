require 'inherited_resources'

module Brad::Resources::Controller
  extend ActiveSupport::Concern
  
  included do
    inherit_resources
  end
end