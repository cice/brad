module Brad::View::LayoutHelpers
  module Sections
    def section *args, &block
      options = args.extract_options!
      h1, small = args
      
      locals = {
        :options  => options,
        :h1       => h1,
        :small    => small
      }
      
      render :layout => "bootstrap/layout/section", :locals => locals, &block
    end
  end
end