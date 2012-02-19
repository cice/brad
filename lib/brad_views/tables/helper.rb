module BradViews::Tables
  module Helper
    def table_for collection, options = {}, &block
      options = options.dup
      builder_class = options[:builder] || BradViews::Tables::Builder
      resource_name = options[:as] || deduce_resource_name

      builder = builder_class.new resource_name, collection, self, options, block

      builder.to_html
    end

    protected
    def deduce_resource_name
      params && params[:controller] || 'resources'
    end
  end
end
