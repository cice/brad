module Brad::Resources
  class Model::Meta
    extend ActiveSupport::Memoizable
  
    attr_reader :model
  
    def initialize model
      @model = model
    end
  
    def fields
      collect_fields.map! do |field_meta|
        Brad::Resources::Model::Field.new self, field_meta
      end
    end
    memoize :fields
  
    protected
    def collect_fields
      model.fields.map do |kv|
        key, val = kv
      
        {
          :name => key,
          :options => val.options
        }
      end
    end
  end
end