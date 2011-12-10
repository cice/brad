module Brad::Resources::View::FormBuilders
  class Bootstrap < Base
    (field_helpers - %w(label fields_for hidden_field radio_box check_box)).each do |field_name|
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def #{field_name} method, options = {}
          bootstrap_field_layout method, options do
            concat super
          end
        end
      RUBY
    end
    
    def bootstrap_field_layout method, options = {}, &block
      options = apply_global_options options
      state = options.delete(:state) || ""
      
      content_div :class => "clearfix #{state}" do
        concat label(method)
        
        with_class state do
          concat content_div(:class => 'input', &block)
        end
      end
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
    def content_tag *args, &block
      @template.content_tag *args, &block
    end
    
    def content_div *args, &block
      args.unshift :div
      
      content_tag *args, &block
    end
    
    def concat buffer
      @template.concat buffer
    end
    
    def apply_global_options options
      options.dup.tap do |o|
        klass = options[:class] ||= ""
        klass << @_with_class if @_with_class
      end
    end
  end
end