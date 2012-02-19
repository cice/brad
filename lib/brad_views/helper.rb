require 'brad_views/tables/helper'

module BradViews
  module Helper
    extend ActiveSupport::Concern

    included do
      include BradViews::Tables::Helper
    end

  end
end
