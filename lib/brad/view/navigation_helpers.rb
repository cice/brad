module Brad::View::NavigationHelpers
  extend ActiveSupport::Concern
  
  autoload :TopBar, 'brad/view/navigation_helpers/top_bar'
  
  included do
    include TopBar
  end
end