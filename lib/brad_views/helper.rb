require 'brad_views/tables/helper'
require 'brad_views/forms/helper'

module BradViews
  module Helper
    extend ActiveSupport::Concern

    included do
      include BradViews::Tables::Helper
      include BradViews::Forms::Helper
    end
  end
end
