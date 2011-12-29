module Brad::Resources::View::TableBuilders
  class Schema < ActiveSupport::BasicObject
    def initialize builder, block
      @builder = builder
      @columns = []
      
      block.call self
    end
    
    def to_a
      @columns
    end
    
    def string key
      @columns << Column.new(key)
      
      nil
    end
  end
end
