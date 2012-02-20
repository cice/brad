module BradViews::Forms
  class Horizontal < Basic

    def help content
      snippets.help_block content
    end

    def labeled_control control, method, options = {}
      control_html = send "plain_#{control}", method, options

      snippets.control_group nil, method do
        @template.concat control_html
      end
    end
  end
end
