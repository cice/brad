module BradViews
  autoload :Tools, 'brad_views/tools'
  autoload :Tables, 'brad_views/tables'

  I18N_SCOPE = Tools::I18nScope.new 'helpers'
end
