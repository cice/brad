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

    def dropdown label, &block
      builder = Dropdown.new self
      content = template.capture builder, &block

      snippets.dropdown label, content
    end

    def to_html
      snippets.container template.capture(self, &@block)
    end
  end
end
