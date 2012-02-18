module Brad::Resources::Model::Mongoid
  class Field

    attr_reader :meta

    def initialize meta, field_meta
      @meta       = meta
      @field_meta = field_meta
    end

    def name
      @field_meta[:name].to_s
    end

    def type
      @field_meta[:options][:type]
    end

    def default
      @field_meta[:options][:default]
    end

    def private?
      name_suggests_private?
    end

    protected
    def name_suggests_private?
      !!(name =~ /^_/)
    end
  end
end
