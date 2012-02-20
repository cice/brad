module BradViews::Forms
  class Horizontal < Basic

    def help content
      snippets.help_block content
    end

    def labeled_control control, method, options = {}
      control_html = send "plain_#{control}", method, options
      state = 'error' if has_errors?(method)

      snippets.control_group nil, method, state do
        @template.concat control_html
        @template.concat error_help_for(method)
      end
    end
  end
end
