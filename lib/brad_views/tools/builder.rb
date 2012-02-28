module BradViews::Tools
  class Builder
    attr_accessor :snippets, :template

    def initialize template, &block
      @template = template
      @block = block
    end
  end
end
