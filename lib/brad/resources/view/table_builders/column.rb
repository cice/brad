module Brad::Resources::View::TableBuilders
  class Column
    attr_reader :key
    
    def initialize key
      @key = key
    end
    
    def retrieve_value_from object
      object.send key
    end
  end
end
