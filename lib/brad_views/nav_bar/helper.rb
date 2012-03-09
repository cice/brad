module BradViews::NavBar
  module Helper
    def nav_bar &block
      builder = BradViews::NavBar::NavBar.new(self, &block)

      builder.to_html
    end
  end
end
