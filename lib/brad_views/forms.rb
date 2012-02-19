module BradViews
  module Forms
    autoload :Snippets, 'brad_views/forms/snippets'

    I18N_SCOPE = BradViews::I18N_SCOPE.derive 'forms'
  end
end
