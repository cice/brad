module Brad::View::AlertHelpers
  ALERT_TYPES = [:success, :warning, :info, :error]

  def alert_msg type, caption, text, &block
    msg_class = type.to_s
    msg_class += " block-message" if block_given?

    locals = {
      :msg_class  => msg_class,
      :caption    => caption,
      :text       => text
    }    

    if block_given?
      render :layout => 'bootstrap/alert/alert', :locals => locals, &block
    else
      render :partial => 'bootstrap/alert/alert', :locals => locals
    end
  end

  ALERT_TYPES.each do |type|
    class_eval <<-RUBY
      def #{type}_msg caption, text, &block
        alert_msg "#{type}", caption, text, &block
      end 
    RUBY
  end
end
