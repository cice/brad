module Brad::Resources::View::FormBuilders
  class Horizontal < Base

    (field_helpers - %w(label fields_for hidden_field)).each do |field_helper|
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
        alias_method "plain_#{field_helper}", "#{field_helper}"
        def #{field_helper} method, options = {}
          bootstrap_field_layout method, options do |input_options|
            concat super(method, input_options)
          end
        end
      RUBY
    end

    def bootstrap_field_layout method, options = {}, &block
      options = apply_global_options options
      state = options.delete(:state) || ""
      prepend = options.delete(:prepend)
      append = options.delete(:append)
      help = options.delete(:help)

      if has_errors?(method)
        help ||= error_help_for method
        state = "error"
      end

      locals = {
        :builder => self,
        :state => state,
        :prepend => prepend,
        :append => append,
        :method => method,
        :help => help
      }

      partial_name = if prepend
        'input_prepend'
      elsif append
        'input_append'
      else
        'input'
      end

      render_partial partial_name, locals do
        block[options]
      end
    end

    def error_help_for method
      if has_errors?(method)
        object.errors[method].join ", "
      else
        nil
      end
    end

    def has_errors? method
      object.errors[method].present?
    end

    def fieldset legend, &block
      render_partial 'fieldset', :legend => legend, &block
    end

    def btn value = nil, options = {}
      options = apply_global_options options

      klass = options[:class] ||= ""
      klass << " btn"

      submit value, options
    end

    def typed_btn value = nil, type = nil, options = {}
      options = apply_global_options options

      type ||= 'primary'
      klass = options[:class] ||= ""
      klass << " btn #{type}"

      submit value, options
    end

    Brad::View::ButtonHelpers::BUTTON_TYPES.each do |type|
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def #{type}_btn value = nil, options = {}
          typed_btn value, '#{type}', options
        end
      RUBY
    end

    def with_class class_name, &block
      @_prior_with_class = @_with_class.dup if @_with_class
      @_with_class ||= ""
      @_with_class << " #{class_name}"

      concat @template.capture(&block)
    ensure
      @_with_class = @_prior_with_class
      @_prior_with_class = nil
    end

    protected
    def partial_prefix
      "bootstrap/form/horizontal/"
    end

    def apply_global_options options
      options.dup.tap do |opts|
        klass = opts[:class]
        klass = if klass
          klass.dup
        else
          opts[:class] = ""
        end

        klass << @_with_class if @_with_class
      end
    end
  end
end
