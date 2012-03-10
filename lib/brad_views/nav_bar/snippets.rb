module BradViews::NavBar
  class Snippets < BradViews::Tools::Snippets
    def container content
      content_tag :div, :class => :navbar do
        content_tag :div, :class => :'navbar-inner' do
          content_tag :div, content, :class => :container
        end
      end
    end

    def list items, options = {}
      tag_options = options.to_tag_options.merge! :class => 'nav'
      content_tag :ul, items, tag_options
    end

    def divider_vertical
      content_tag :li, '', :class => 'divider-vertical'
    end

    def link_to body, url, options = {}, &block
      li_options = {}
      li_options[:class] = 'active' if template.current_page?(url)

      content_tag :li, template.link_to(body, url, options), li_options
    end

    def icon_link_to icon_type, label, url, options = {}
      body = template.icon(icon_type, :class => 'icon-white') + ' ' + label

      link_to body, url, options
    end

    def dropdown label, content
      content_tag :li, :class => 'dropdown' do
        toggle = template.link_to('#', :class => 'dropdown-toggle', :'data-toggle' => 'dropdown') do
          concat label + ' '
          concat content_tag(:span, '', :class => 'caret')
        end

        concat toggle
        concat content_tag(:ul, content, :class => 'dropdown-menu')
      end
    end

    def divider
      content_tag :li, '', :class => 'divider'
    end

    def header label, options = {}
      options = options.to_tag_options.merge! :class => 'nav-header'

      content_tag :li, label, options
    end
  end
end
