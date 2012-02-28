module BradViews::NavBar
  class Dropdown < BradViews::Tools::Builder

    def initialize template, &block
      super

      @snippets = Snippets.new template
    end
  end
end
