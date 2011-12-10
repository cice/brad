module Brad::Resources::View::FormBuilders
  class Bootstrap < Base
    (field_helpers - %w(label fields_for hidden_field radio_box check_box)).each do |field_name|
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def #{field_name} method, options = {}
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
      
      # content_div :class => "clearfix #{state}" do
      #   concat label(method)
      #   
      #   with_class state do
      #     if prepend
      #       concat content_div(:class => 'input') {
      #         concat content_div(:class => 'input-prepend') {
      #           concat content_span(prepend, :class => 'add-on')
      #           concat @template.capture(&block)
      #         }
      #       }
      #     else
      #       concat content_div(:class => 'input', &block)
      #     end
      #   end
      # end
    end
    
    def fieldset legend, &block
      content_tag :fieldset do
        concat content_tag(:legend, legend)
        concat @template.capture(&block)
      end
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
    
    def content_tag *args, &block
      @template.content_tag *args, &block
    end
    
    def content_div *args, &block
      content_tag :div, *args, &block
    end
    
    def content_span *args, &block
      content_tag :span, *args, &block
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