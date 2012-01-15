module Brad
  module View
    extend ActiveSupport::Concern

    autoload :I18nScope,          'brad/view/i18n_scope'

    autoload :TagOptions,         'brad/view/tag_options'

    autoload :BuilderTools,       'brad/view/builder_tools'

    autoload :LayoutHelpers,      'brad/view/layout_helpers'
    autoload :NavigationHelpers,  'brad/view/navigation_helpers'
    autoload :AlertHelpers,       'brad/view/alert_helpers'
    autoload :ButtonHelpers,      'brad/view/button_helpers'
    autoload :LabelHelpers,       'brad/view/label_helpers'

    I18N_SCOPE = I18nScope.new 'helpers'

    included do
      include LayoutHelpers
      include NavigationHelpers
      include AlertHelpers
      include ButtonHelpers
      include LabelHelpers
    end
  end
end
