module Brad::Resources::View::TableBuilders
  class Schema < ActiveSupport::BasicObject
    NUMERIC_HELPERS = [ :number_to_currency, :number_to_human, :number_to_human_size, :number_to_percentag,
      :number_to_phone, :number_with_delimiter, :number_with_precision, :localize, :l
    ]
    
    ALPHA_NUMERIC = 'alpha-numeric'
    NUMERIC = 'numeric'
    
    def initialize builder, block
      @builder = builder
      @columns = []
      
      block.call self
    end
    
    def to_a
      @columns
    end
    
    def string key, options = {}
      new_column key, options, :class => ALPHA_NUMERIC
      
      nil
    end
    
    def numeric key, options = {}
      new_column key, options, :class => NUMERIC
      
      nil
    end
    
    def helper key, name, options = {}
      klass = numeric_helper?(name) ? NUMERIC : ALPHA_NUMERIC
      new_column key, options, :class => klass, :helper_name => name
      
      nil
    end
    
    protected
    def numeric_helper? name
      NUMERIC_HELPERS.include? name.to_sym
    end
    
    def new_column key, options, additional_options = {}
      @columns << Column.new(key, additional_options.merge!(options))
    end
    
    def method_missing name, key, *args, &block
      options = args.extract_options!
      helper key, name, options
    end
  end
end
