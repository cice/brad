module Brad::Resources::Helper
  extend ActiveSupport::Concern

  included do
    helper Brad::Resources::View

    prepend_view_path 'app/views/brad_resources'
  end
end
