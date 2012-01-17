module Brad::View::LayoutHelpers
  extend ActiveSupport::Concern

  autoload :SectionHelpers, 'brad/view/layout_helpers/section_helpers'

  included do
    include SectionHelpers
  end
end
