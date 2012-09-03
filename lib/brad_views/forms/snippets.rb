module BradViews::Forms
  class Snippets < BradViews::Tools::Snippets
    def control_group label_html, state = nil, &block
      html_class = 'control-group'
      html_class += " #{state}" if state.present?

      div_tag :class => html_class do
        concat label_html

        div_tag!(:class => 'controls', &block)
      end
    end

    def help_block content
      content_tag :p, content, :class => 'help-block'
    end

    def help_inline content
      content_tag :span, content, :class => 'help-inline'
    end

    def input_prepend content, &block
      div_tag :class => 'input-prepend' do
        span_tag! content, :class => 'add-on'
        block.call
      end
    end

    def input_append content, &block
      div_tag :class => 'input-append' do
        block.call
        span_tag! content, :class => 'add-on'
      end
    end
  end
end
