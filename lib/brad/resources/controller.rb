require 'inherited_resources'
require 'brad/resources/helper'

module Brad::Resources::Controller
  extend ActiveSupport::Concern

  included do
    inherit_resources
    include Brad::Resources::Helper
    helper Brad::Resources::View

    prepend_view_path 'app/views/brad_resources'
  end
end
