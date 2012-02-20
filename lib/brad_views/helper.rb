require 'brad_views/tables/helper'
require 'brad_views/forms/helper'
require 'brad_views/icons'

module BradViews
  module Helper
    extend ActiveSupport::Concern

    included do
      include BradViews::Tables::Helper
      include BradViews::Forms::Helper
      include BradViews::Icons
    end
  end
end
