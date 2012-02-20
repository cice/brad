module BradViews::Forms
  class Search < Basic
    attr_accessor :snippets

    def search_field method, options = {}
      options = options.to_tag_options.merge! :class => 'search-query'

      plain_search_field method, options
    end

  end
end
