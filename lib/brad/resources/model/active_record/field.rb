module Brad::Resources::Model::ActiveRecord
  class Field
    extend ActiveSupport::Memoizable

    attr_reader :meta

    def initialize meta, field_meta
      @meta       = meta
      @field_meta = field_meta
    end
  end
end
