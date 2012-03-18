module BradViews::NavBar
  module Helper
    def nav_bar &block
      builder = BradViews::NavBar::NavBar.new(self, &block)

      builder.to_html
    end

    def nav_list &block
      builder = BradViews::NavBar::NavBar.new(self, &block)

      builder.to_nav_list
    end
  end
end
