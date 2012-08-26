require 'brad_i18n'

module BradViews
  extend ActiveSupport::Autoload

  autoload :Tools
  autoload :Tables
  autoload :Forms
  autoload :NavBar

  I18N_SCOPE = BradI18n::Scope.new 'helpers'
end

require 'brad_views/helper'
