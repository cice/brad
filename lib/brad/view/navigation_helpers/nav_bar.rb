module Brad::View::NavigationHelpers
  module NavBar
    def nav_bar brand = nil, brand_url = '#', &block
      locals = {
        :brand      => brand,
        :brand_url  => brand_url
      }

      if block_given?
        render :layout => 'bootstrap/navigation/nav_bar', :locals => locals, &block
      else
        render :partial => 'bootstrap/navigation/nav_bar', :locals => locals
      end
    end

    def nav_list &block
      render :layout => 'bootstrap/navigation/nav_list', &block
    end

    def nav_t key, options = {}
      @nav_i18n_scope ||= Brad::View::I18N_SCOPE.derive :nav

      @nav_i18n_scope.t key, options
    end

    def nav_link_to body_or_url, *link_to_args, &block
      url = block_given? ? body_or_url : link_to_args.first
      body_or_url = block_given? ? body_or_url : nav_t(body_or_url)
      is_active = current_page?(url) ? 'active' : nil

      locals = {
        :body_or_url => body_or_url,
        :args        => link_to_args,
        :block       => block,
        :li_class    => is_active
      }
      render :partial => 'bootstrap/navigation/nav_link_to', :locals => locals
    end

    def nav_down body, &block
      locals = {
        :body => body
      }

      render :layout => 'bootstrap/navigation/nav_down', :locals => locals, &block
    end

    def nav_divider
      content_tag :li, '', :class => 'divider'
    end
  end
end
