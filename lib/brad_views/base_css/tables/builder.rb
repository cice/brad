module BradViews::BaseCss::Tables
  class Builder
    include BradViews::Tools::Builder
    attr_reader :resource_name, :collection, :template, :options, :columns, :i18n_scope, :snippets

    I18N_SCOPE = BradViews::I18N_SCOPE.derive 'tables'

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

      snippets.table render_head, render_foot, options, html_options do
        collection.each do |object|
          concat render_row(object)
        end
      end
    end

    def render_row object
      html_options = {
        :class => singular_resource_name
      }

      snippets.table_row nil, html_options do
        columns.each do |column|
          concat render_cell(column, object)
        end
      end
    end

    def render_head
      nil
    end

    def render_foot
      nil
    end

    protected
    def t key, options = {}
      @i18n_scope.t key, options
    end

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
