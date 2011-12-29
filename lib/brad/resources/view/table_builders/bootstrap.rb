module Brad::Resources::View::TableBuilders
  class Bootstrap < Base
    protected
    def partial_prefix
      "bootstrap/#{super}"
    end
  end
end
