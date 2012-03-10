module BradViews::NavBar
  class NavBar < BradViews::Tools::Builder

    def initialize template, &block
      super

      @snippets = Snippets.new template
    end

    def list &block
      items = template.capture &block
      snippets.list items
    end

    def link_to body, url, options = {}
      snippets.link_to body, url, options
    end

    def icon_link_to icon_type, label, url, options = {}
      snippets.icon_link_to icon_type, label, url, options
    end

    def dropdown label, &block
      @_dropdown = true
      content = template.capture &block

      snippets.dropdown label, content
    ensure
      @_dropdown = false
    end

    def header label, options = {}
      snippets.header label, options
    end

    def divider
      if @_dropdown
        snippets.divider
      else
        snippets.divider_vertical
      end
    end

    def to_html
      snippets.container template.capture(self, &@block)
    end
  end
end
