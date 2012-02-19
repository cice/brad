module BradViews::Tools
  class Snippets
    attr_reader :template

    def initialize template
      @template = template
    end

    def respond_to? name, include_private = false
      if name.to_s[-1] == '!'
        true
      else
        super
      end
    end

    def concat string
      template.concat string
    end

    def capture *args, &block
      template.capture *args, &block
    end

    def content_tag *args, &block
      template.content_tag *args, &block
    end

    def tag *args, &block
      template.tag *args, &block
    end

    def div_tag *args, &block
      content_tag :div, *args, &block
    end

    def span_tag *args, &block
      content_tag :span, *args, &block
    end

    protected
    def method_missing name, *args, &block
      super unless respond_to?(name)

      name = name.to_s[0..-2]

      self.class.class_eval <<-RUBY
        def #{name}! *args, &block
          concat #{name}(*args, &block)
        end
      RUBY

      concat send(name, *args, &block)
    end
  end
end
