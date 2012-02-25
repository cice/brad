require 'brad_views/tables/helper'
require 'brad_views/forms/helper'

require 'brad_views/buttons'
require 'brad_views/nav_bar'

module BradViews
  module Helper
    extend ActiveSupport::Concern

    included do
      include BradViews::Tables::Helper
      include BradViews::Forms::Helper
      include BradViews::Buttons
      include BradViews::NavBar
    end
  end
end
