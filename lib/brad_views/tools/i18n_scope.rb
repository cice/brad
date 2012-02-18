module BradViews::Tools
  class I18nScope
    def initialize scope, parent = I18n
      @scope = scope
      @parent = parent
    end

    def t key, options = {}
      @parent.t "#{@scope}.#{key}", options
    end

    def derive scope
      self.class.new scope, self
    end
  end
end
