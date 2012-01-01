module Brad::Resources::View::LayoutHelpers
  extend ActiveSupport::Concern
  
  autoload :Sections, 'brad/resources/view/layout_helpers/sections'
  
  included do
    include Sections
  end
end