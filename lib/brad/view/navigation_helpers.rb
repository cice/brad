module Brad::View::NavigationHelpers
  extend ActiveSupport::Concern

  autoload :NavBar, 'brad/view/navigation_helpers/nav_bar'

  included do
    include NavBar
  end
end
