module Brad::View::ButtonHelpers
  BUTTON_TYPES =  [:primary, :secondary, :info, :success, :danger]

  def btn_to *link_to_args, &block
    options = link_to_args.extract_options!.to_tag_options.merge! :class => 'btn'

    link_to *(link_to_args << options), &block
  end

  BUTTON_TYPES.each do |type|
    class_eval <<-RUBY
      def #{type}_btn_to *btn_to_args, &block
        options = btn_to_args.extract_options!.to_tag_options.merge :class => %Q{#{type}}

        btn_to *(btn_to_args << options), &block
      end
    RUBY
  end
end
