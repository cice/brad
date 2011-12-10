require 'inherited_resources'

module Brad::Resources::Controller
  extend ActiveSupport::Concern
  
  included do
    inherit_resources
    helper Brad::Resources::View
  end
end