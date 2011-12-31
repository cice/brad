module Brad::Resources::View::TableBuilders
  class Column
    attr_reader :keys, :options
    
    def initialize keys, options = {}
      @keys = keys
      @options = options
    end
    
    def key
      keys.first
    end
    
    def cell_class
      [key.to_s, options[:class]] * " "
    end
    
    def helper_name
      @options[:helper_name]
    end
    
    def helper_args
      args = @options[:helper]
      
      case args
      when Array
        args
      when nil
        []
      else
        [args]
      end
    end
    
    def render_value object, template
      value = retrieve_value_from object
      
      name = helper_name
      name && template.send(name, value, *helper_args) || value
    end
    
    def retrieve_value_from object
      keys.inject object do |memo, key|
        memo.try key
      end
    end
  end
end
