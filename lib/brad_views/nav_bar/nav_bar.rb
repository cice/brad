module BradViews::NavBar
  class NavBar < BradViews::Tools::Builder

    I18N_SCOPE = BradViews::I18N_SCOPE.derive 'nav_bar'

    def initialize template, &block
      super

      @snippets = Snippets.new template
    end

    def t key, options = {}
      I18N_SCOPE.t key, options
    end

    def brand body, url
      template.link_to body, url, class: 'brand'
    end

    def list &block
      items = template.capture &block
      snippets.list items
    end

    def link_to body, url, options = {}
      snippets.link_to t(body), url, options
    end

    def icon_link_to icon_type, label, url, options = {}
      snippets.icon_link_to icon_type, t(label), url, options
    end

    def dropdown label, &block
      @_dropdown = true
      content = template.capture &block

      snippets.dropdown t(label), content
    ensure
      @_dropdown = false
    end

    def header label, options = {}
      snippets.header t(label), options
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

    def to_nav_list
      snippets.list template.capture(self, &@block), class: 'nav-list'
    end
  end
end
