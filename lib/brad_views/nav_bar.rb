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

      content_tag :li, li_options do
        concat link_to(body, url, options)
      end
    end
  end
end
