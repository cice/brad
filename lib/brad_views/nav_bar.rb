module BradViews
  module NavBar

    def nav_bar &block
      content_tag :div, :class => :navbar do
        content_tag :div, :class => :'navbar-inner' do
          content_tag :div, :class => :container, &block
        end
      end
    end

    def nav_list &block
      content_tag :ul, :class => 'nav', &block
    end

    def nav_link_to body, url, options = {}, &block
      li_options = {}
      li_options[:class] = 'active' if current_page?(url)

      content_tag :li, link_to(body, url, options), li_options
    end

    def nav_dropdown label, &block
      content_tag :li, :class => 'dropdown' do
        concat link_to('#', :class => 'dropdown-toggle', :'data-toggle' => 'dropdown') {
          concat label + ' '
          concat content_tag(:span, '', :class => 'caret')
        }
        concat content_tag :ul, :class => 'dropdown-menu', &block
      end
    end

    def drop_link_to body, url, options = {}
      content_tag :li, link_to(body, url), options
    end

    def drop_divider options = {}
      options = options.to_tag_options.merge! :class => 'divider'

      content_tag :li, '', options
    end

    def drop_header label, options = {}
      options = options.to_tag_options.merge! :class => 'nav-header'

      content_tag :li, label, options
    end
  end
end
