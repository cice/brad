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
  end
end