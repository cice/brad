module BradViews::Tables
  class Snippets < BradViews::Tools::Snippets

    def table header = nil, footer = nil, options = {}, html_options = {}, &block
      html_options = html_options.to_tag_options.merge :class => 'table'

      %w(striped bordered condensed).each do |style|
        options[style.to_sym] && html_options.merge!(:class => "table-#{style}")
      end

      content_tag :table, html_options do
        header && table_header!(header)
        block && table_body!(&block)
        footer && table_footer!(footer)
      end
    end

    def table_header content = nil, options = nil, &block
      content_tag :thead, content, options, &block
    end

    def table_footer content = nil, options = nil, &block
      content_tag :tfoot, content, options, &block
    end

    def table_body content = nil, options = nil, &block
      content_tag :tbody, content, options, &block
    end

    def table_row content = nil, options = nil, &block
      content_tag :tr, content, options, &block
    end

    def table_cell content = nil, options = nil, &block
      content_tag 'td', content, options, &block
    end

    def table_head_cell content = nil, options = nil, &block
      content_tag 'th', content, options, &block
    end
  end
end
