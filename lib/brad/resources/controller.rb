require 'inherited_resources'

module Brad::Resources::Controller
  extend ActiveSupport::Concern

  included do
    inherit_resources
    include Brad::Resources::Helper
  end
end
