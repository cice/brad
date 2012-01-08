module Brad::View::ButtonHelpers
  def btn_to *link_to_args, &block
    options = link_to_args.extract_options!.dup
    options[:class] ||= ""
    options[:class] += " btn"

    link_to *(link_to_args << options), &block
  end  
end
