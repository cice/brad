module BradViews::Tables
  class Schema < ActiveSupport::BasicObject
    NUMERIC_HELPERS = [ :number_to_currency, :number_to_human, :number_to_human_size, :number_to_percentag,
      :number_to_phone, :number_with_delimiter, :number_with_precision, :localize, :l,
      :distance_of_time_in_words_to_now, :distance_of_time_in_words
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

    def string *keys_and_options, &block
      new_column keys_and_options, :class => ALPHA_NUMERIC, &block

      nil
    end

    def numeric *keys_and_options, &block
      new_column keys_and_options, :class => NUMERIC, &block

      nil
    end

    def buttons options = {}, &block
      new_column [:buttons, options], :caption => '', :class => NUMERIC, &block

      nil
    end

    def if_empty content = nil, &block
      @builder.if_empty = content || block
    end

    protected
    def helper name, *keys_and_options, &block
      klass = numeric_helper?(name) ? NUMERIC : ALPHA_NUMERIC
      new_column keys_and_options, :class => klass, :helper_name => name, &block

      nil
    end

    def numeric_helper? name
      NUMERIC_HELPERS.include? name.to_sym
    end

    def new_column keys_and_options, additional_options = {}, &block
      keys = keys_and_options
      options = keys_and_options.extract_options!

      @columns << Column.new(keys, additional_options.merge!(options), &block)
    end

    def method_missing name, *keys_and_options, &block
      helper name, *keys_and_options, &block
    end
  end
end
