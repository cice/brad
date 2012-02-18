module Brad::Resources::View::FormBuilders
  autoload :Base, 'brad/resources/view/form_builders/base'
  autoload :Horizontal, 'brad/resources/view/form_builders/horizontal'

  class << self
    def builder_for style
      const_get style.to_s.camelize
    end
  end
end
