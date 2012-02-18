module Brad::Resources::View::FormHelpers
  def form_for record, options = {}, &block
    options = options.dup
    style = options[:style] || 'horizontal'
    options[:builder] ||= Brad::Resources::View::FormBuilders.builder_for(style)

    super record, options, &block
  end
end
