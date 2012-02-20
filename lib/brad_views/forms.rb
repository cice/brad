module BradViews
  module Forms
    autoload :Snippets, 'brad_views/forms/snippets'
    autoload :Basic, 'brad_views/forms/basic'
    autoload :Search, 'brad_views/forms/search'
    autoload :Horizontal, 'brad_views/forms/horizontal'

    I18N_SCOPE = BradViews::I18N_SCOPE.derive 'forms'
  end
end
