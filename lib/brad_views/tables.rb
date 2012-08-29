module BradViews
  module Tables
    autoload :Snippets, 'brad_views/tables/snippets'
    autoload :Builder, 'brad_views/tables/builder'
    autoload :Schema, 'brad_views/tables/schema'
    autoload :Column, 'brad_views/tables/column'

    I18N_SCOPE = BradI18n::Scope.new(:activerecord)[:attributes]
  end
end
