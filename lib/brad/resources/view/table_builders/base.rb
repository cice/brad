module Brad::Resources::View::TableBuilders
  class Base
    include Brad::Resources::View::BuilderTools
    attr_reader :resource_name, :collection, :template, :options, :block
    
    def initialize resource_name, collection, template, options, block
      @resource_name, @collection, @template, @options, @block = resource_name, collection, template, options, block
    end
    
    def to_html
      render_table.html_safe
    end
    
    protected
    def id
      options[:id]
    end
    
    def partial_prefix
      'table/'
    end
    
    def render_table
      locals = {
        :id => id,
        :resource_name => resource_name
      }
      
      render_partial 'container', locals
    end
  end
end
