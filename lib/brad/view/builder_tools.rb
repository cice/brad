module Brad::View
  module BuilderTools

    protected
    def partial_prefix
      ''
    end
    
    def render_partial partial, locals = {}, &block
      partial = [partial_prefix, partial].join

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
  end
end