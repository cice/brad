module Brad::Resources::View::FormBuilders
  class Bootstrap < Base
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
      
      locals = {
        :builder => self,
        :state => state,
        :prepend => prepend,
        :append => append,
        :method => method
      }
      
      partial_name = if prepend
        'input_prepend'
      elsif append
        'input_append'
      else
        'input'
      end
      
      partial partial_name, locals do
        block[options]
      end
    end
    
    def fieldset legend, &block
      partial 'fieldset', :legend => legend, &block
    end
    
    def typed_btn value = nil, type = nil, options = {}
      options = apply_global_options options
      
      type ||= 'primary'
      klass = options[:class] ||= ""
      klass << " btn #{type}"
      
      submit value, options
    end
    
    %w(primary secondary info success danger).each do |type|
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
    def partial partial, locals = {}, &block
      partial = "bootstrap_form/#{partial}"

      if block_given?
        render :layout => partial, :locals => locals, &block
      else
        render :partial => partial, :locals => locals
      end
    end
    
    def render *args, &block
      @template.render *args, &block
    end
    
    def concat buffer
      @template.concat buffer
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