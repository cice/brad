module BradViews::Tables
  class Column
    attr_reader :keys, :options, :block

    def initialize keys, options = {}, &block
      @keys = keys
      @options = options
      @block = block
    end

    def key
      @key ||= keys.join '_'
    end

    def cell_class
      [key.to_s, options[:class]] * " "
    end

    def helper_name
      @options[:helper_name]
    end

    def helper_args
      args = @options[:helper]

      case args
      when Hash
        [args.dup]
      when Array
        args.map do |e|
          Hash === e ? e.dup : e
        end
      when nil
        []
      else
        [args]
      end
    end

    def render_value object, template = nil
      value = retrieve_value_from object, template

      if name = helper_name
        args = helper_args
        template.send name, value, *args
      else
        value
      end
    end

    def retrieve_value_from object, template = nil
      if template && block
        return template.capture(object, &block)
      end

      keys.inject object do |memo, key|
        memo.try key
      end
    end
  end
end
