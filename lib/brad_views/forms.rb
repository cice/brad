module BradViews
  module Forms
    extend ActiveSupport::Autoload

    autoload :Snippets
    autoload :Basic
    autoload :Search
    autoload :Horizontal

    I18N_SCOPE = BradViews::I18N_SCOPE['forms']
  end
end
