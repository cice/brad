module Brad::Resources::Model::ActiveRecord
  class Meta
    extend ActiveSupport::Memoizable

    attr_reader :model

    def initialize model
      @model = model
    end

    def fields
      model.columns.map do |column|
        Field.new self, column
      end
    end
    memoize :fields

  end
end
