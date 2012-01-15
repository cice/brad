module Brad::Resources::Model
  module Mongoid
    include Base

    autoload :Meta, 'brad/resources/model/mongoid/meta'
    autoload :Field, 'brad/resources/model/mongoid/field'
  end
end
