module Brad::View::NavigationHelpers
  module TopBar
    autoload :Builder,  'brad/view/navigation_helpers/top_bar/builder'
    
    def top_bar brand = nil, brand_url = '#'
      locals = {
        :brand      => brand,
        :brand_url  => brand_url
      }
      
      render :partial => 'bootstrap/navigation/top_bar', :locals => locals
    end
    
    def nav_list &block
      render :layout => 'bootstrap/navigation/nav_list', &block
    end
    
    def nav_link_to body_or_url, *link_to_args, &block
      url = block_given? ? body_or_url : link_to_args.first
      is_active = current_page?(url) ? 'active' : nil
      
      locals = {
        :body       => body_or_url,
        :args       => link_to_args,
        :block      => block,
        :li_class   => is_active
      }
      render :partial => 'bootstrap/navigation/nav_link_to', :locals => locals
    end
  end
end