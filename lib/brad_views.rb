require 'brad_i18n'
require 'brad_views/tools'

module BradViews
  extend ActiveSupport::Autoload

  autoload :Tables
  autoload :Forms
  autoload :NavBar

  I18N_SCOPE = BradI18n::Scope.new 'helpers'
end

require 'brad_views/helper'
