module Brad::Resources::View::FormBuilders
  class Bootstrap < Base
    (field_helpers - %w(label fields_for hidden_field)).each do |field_name|
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def #{field_name} method, options = {}
          bootstrap_field_layout method, options do
            concat super
          end
        end
      RUBY
    end
    
    def bootstrap_field_layout method, options = {}, &block
      content_div :class => 'clearfix' do
        concat label(method)
        concat content_div(:class => 'input', &block)
      end
    end
    
    def fieldset legend, &block
      content_tag :fieldset do
        concat content_tag(:legend, legend)
        concat block[]
      end
    end
    
    def typed_btn value = nil, type = nil, options = {}
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
  end
end