module BradViews::Tables
  class Builder < BradViews::Tools::Builder
    attr_reader :resource_name, :collection, :options, :columns, :i18n_scope

    def initialize resource_name, collection, template, options, block
      @resource_name, @collection, @template, @options = resource_name, collection, template, options

      @snippets = Snippets.new template
      @columns = Schema.new(self, block).to_a
      @i18n_scope = I18N_SCOPE.derive resource_name
    end

    def to_html
      html_options = {
        :id => id,
        :class => table_class
      }

      snippets.table render_head, nil, options, html_options do
        collection.each do |object|
          template.concat render_row(object)
        end
      end
    end

    def render_row object
      html_options = {
        :class => singular_resource_name
      }

      snippets.table_row nil, html_options do
        columns.each do |column|
          template.concat render_cell(column, object)
        end
      end
    end

    def render_cell column, object
      value = column.render_value object, template

      snippets.table_cell value, :class => column.cell_class
    end

    def render_head
      snippets.table_row do
        columns.each do |column|
          template.concat render_head_cell(column)
        end
      end
    end

    def render_head_cell column
      caption = column.caption(@i18n_scope)
      snippets.table_head_cell caption, { :class => column.cell_class }
    end

    def t key, options = {}
      @i18n_scope.t key, options
    end

    protected
    def singular_resource_name
      @singular_resource_name ||= resource_name.to_s.singularize.to_sym
    end

    def id
      options[:id]
    end

    def table_class
      [resource_name, options[:class]] * ' '
    end
  end
end
