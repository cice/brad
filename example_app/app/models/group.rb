class Group
  include Mongoid::Document
  include Brad::Resources::Model::Mongoid

  field :name, type: String
end
