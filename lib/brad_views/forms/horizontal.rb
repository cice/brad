module BradViews::Forms
  class Horizontal < Basic

    def help content
      snippets.help_block content
    end

    def labeled_control control, method, options = {}, *args
      control_html = send "plain_#{control}", method, options, *args
      state = 'error' if has_errors?(method)

      label = I18n.t method, scope: "activerecord.attributes.#{object.class.model_name.singular}"
      label_html = label(method, label, :class => 'control-label')
      snippets.control_group label_html, state do
        @template.concat control_html
        @template.concat error_help_for(method)
      end
    end
  end
end
