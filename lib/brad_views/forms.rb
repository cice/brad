module BradViews
  module Forms
    autoload :Snippets, 'brad_views/forms/snippets'
    autoload :Basic, 'brad_views/forms/basic'

    I18N_SCOPE = BradViews::I18N_SCOPE.derive 'forms'
  end
end
