module Brad::Resources::View::TableBuilders
  class Column
    attr_reader :keys, :options, :builder, :block

    def initialize builder, keys, options = {}, block
      @keys = keys
      @options = options
      @builder = builder
      @block = block
    end

    def key
      keys.first
    end

    def cell_class
      [key.to_s, options[:class]] * " "
    end

    def helper_name
      @options[:helper_name]
    end

    def helper_args
      args = @options[:helper]

      ap args
      case args
      when Hash
        [args.dup]
      when Array
        args.map do |e|
          Hash =~ e ? e.dup : e
        end
      when nil
        []
      else
        [args]
      end
    end

    def render_value object, template
      value = retrieve_value_from object

      name = helper_name
      args = helper_args
      name && template.send(name, value, *args) || value
    end

    def retrieve_value_from object
      return retrieve_value_from_block_with(object) if block

      keys.inject object do |memo, key|
        memo.try key
      end
    end

    def retrieve_value_from_block_with object
      builder.template.capture object, &block
    end
  end
end
