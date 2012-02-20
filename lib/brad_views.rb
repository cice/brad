module BradViews
  autoload :Tools, 'brad_views/tools'
  autoload :Tables, 'brad_views/tables'
  autoload :Forms, 'brad_views/forms'

  I18N_SCOPE = Tools::I18nScope.new 'helpers'
end

require 'brad_views/helper'
