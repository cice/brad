module BradI18n
  class Scope
    def initialize scope, parent = I18n
      @scope = scope
      @parent = parent

      @children = Hash.new do |children, scope|
        children[scope.to_s] = self.class.new scope.to_s, self
      end
    end

    def t key, options = {}
      @parent.t "#{@scope}.#{key}", options
    end

    def derive scope
      @children[scope.to_s]
    end
    alias_method :[], :derive
  end
end
