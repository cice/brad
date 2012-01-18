module Brad::View::DialogHelpers
  class DialogBuilder
    include Brad::View::BuilderTools

    attr_reader :template, :options, :block

    def initialize template, options, block
      @template, @options, @block = template, options, block
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
