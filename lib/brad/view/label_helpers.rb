module Brad::View::LabelHelpers
  LABEL_TYPES = [:success, :warning, :important, :notice]

  def span_label type, caption
    span_class = type.to_s
    span_class += " label"

    locals = {
      :span_class  => span_class,
      :caption     => caption
    }

    render :partial => 'bootstrap/span_label', :locals => locals
  end

  LABEL_TYPES.each do |type|
    class_eval <<-RUBY
      def #{type}_label caption
        span_label "#{type}", caption
      end
    RUBY
  end
end
