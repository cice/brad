module Brad::View::LayoutHelpers
  module Sections
    def section_t key, options = {}
      @section_i18n_scope ||= Brad::View::I18N_SCOPE.derive 'section'

      @section_i18n_scope.t key, options
    end

    def section *args, &block
      options = args.extract_options!
      h1, small = args

      locals = {
        :options  => options,
        :h1       => section_t(h1),
        :small    => small
      }

      render :layout => "bootstrap/layout/section", :locals => locals, &block
    end
  end
end
