module Brad::Resources::View::TableBuilders
  class Column
    attr_reader :key, :options
    
    def initialize key, options = {}
      @key = key
      @options = options
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
      object.send key
    end
  end
end
