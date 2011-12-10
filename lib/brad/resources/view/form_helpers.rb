module Brad::Resources::View::FormHelpers
  def form_for record, options = {}, &block
    options = options.dup
    options[:builder] ||= Brad::Resources::View::FormBuilders::Bootstrap
    
    super record, options, &block
  end
end