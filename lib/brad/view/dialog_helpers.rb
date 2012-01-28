module Brad::View::DialogHelpers
  class DialogBuilder
    include Brad::View::BuilderTools

    attr_reader :template, :options, :block

    def initialize template, options, block
      @template, @options, @block = template, options, block
    end

    def header content = nil, &block
      @header = content || block
    end

    def footer content = nil, &block
      @footer = content || block
    end

    def render_header
      if @header.is_a? Proc
        template.capture &@header
      else
        @header.to_s
      end
    end

    def render_body
      template.capture self, &block
    end

    def render_footer
      if @footer.is_a? Proc
        template.capture &@footer
      else
        @footer.to_s
      end
    end

    def to_html
      body = render_body  # body must be evaluated first!
      render_partial "dialog", :header => render_header, :footer => render_footer, :body => body, :options => options
    end

    protected
    def partial_prefix
      "bootstrap/#{super}"
    end
  end

  def dialog options = {}, &block
    DialogBuilder.new(self, options, block).to_html.html_safe
  end
end
