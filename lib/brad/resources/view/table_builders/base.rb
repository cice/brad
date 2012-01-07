module Brad::Resources::View::TableBuilders
  class Base
    include Brad::View::BuilderTools
    attr_reader :resource_name, :collection, :template, :options, :columns
    
    def initialize resource_name, collection, template, options, block
      @resource_name, @collection, @template, @options = resource_name, collection, template, options
      
      @columns = Schema.new(self, block).to_a
    end
    
    def to_html
      render_table.html_safe
    end
    
    protected
    def singular_resource_name
      @singular_resource_name ||= resource_name.to_s.singularize.to_sym
    end
    
    def id
      options[:id]
    end
    
    def partial_prefix
      'table/'
    end
    
    def table_class
      [resource_name, options[:class]] * ' '
    end
    
    def render_table
      locals = {
        :id => id,
        :table_class => table_class,
        :head => render_head_row
      }
      
      render_partial 'container', locals do
        collection.each do |object|
          concat render_row(object).html_safe
        end
      end
    end
    
    def render_head_row
      locals = {
        :object => nil,
        :resource_name => nil
      }
      
      render_partial 'row', locals do
        columns.each do |column|
          concat render_head_cell(column).html_safe
        end
      end
    end
    
    def render_row object
      locals = {
        :object => object,
        :resource_name => singular_resource_name
      }
      
      render_partial 'row', locals do
        columns.each do |column|
          concat render_cell(column, object).html_safe
        end
      end
    end
    
    def render_cell column, object
      value = column.render_value object, template
      
      locals = {
        :value => value,
        :cell_class => column.cell_class
      }
      
      render_partial 'cell', locals
    end
    
    def render_head_cell column
      value = column.key
      
      locals = {
        :value => value,
        :cell_class => column.cell_class
      }
      
      render_partial 'head_cell', locals
    end
  end
end
