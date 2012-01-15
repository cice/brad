module Brad::Resources::Model
  module ActiveRecord
    include Base

    autoload :Meta, 'brad/resources/model/active_record/meta'
    autoload :Field, 'brad/resources/model/active_record/field'

  end
end
