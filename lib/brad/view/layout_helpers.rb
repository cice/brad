module Brad::View::LayoutHelpers
  extend ActiveSupport::Concern
  
  autoload :Sections, 'brad/view/layout_helpers/sections'
  
  included do
    include Sections
  end
end