module BradViews::Forms
  class Snippets < BradViews::Tools::Snippets
    def control_group label, label_for = nil, &block
      div_tag :class => 'control-group' do
        concat template.label_tag(label_for, label, :class => 'control-label')

        div_tag!(:class => 'controls', &block)
      end
    end

    def help_block content
      content_tag :p, content, :class => 'help-block'
    end
  end
end
