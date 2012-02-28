require 'brad_views/tables/helper'
require 'brad_views/forms/helper'
require 'brad_views/nav_bar/helper'

require 'brad_views/buttons'

module BradViews
  module Helper
    extend ActiveSupport::Concern

    included do
      include BradViews::Tables::Helper
      include BradViews::Forms::Helper
      include BradViews::NavBar::Helper
      include BradViews::Buttons
    end
  end
end
