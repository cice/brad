module Brad::Resources::Model
  autoload :Meta, 'brad/resources/model/meta'
  autoload :Field, 'brad/resources/model/field'
  
  extend ActiveSupport::Concern
  
  included do
    include Mongoid::Document
  end
end