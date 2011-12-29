module Brad::Resources::View::FormBuilders
  class Base < ActionView::Helpers::FormBuilder
    include Brad::Resources::View::BuilderTools
    
    protected
    def partial_prefix
      'form/'
    end
  end
end