module BradViews
  module Tables
    autoload :Snippets, 'brad_views/tables/snippets'
    autoload :Builder, 'brad_views/tables/builder'
    autoload :Schema, 'brad_views/tables/schema'
    autoload :Column, 'brad_views/tables/column'

    I18N_SCOPE = BradViews::I18N_SCOPE[:label]
  end
end
