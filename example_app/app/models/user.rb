class User
  include Brad::Resources::Model
  
  field :firstname,     type: String
  field :lastname,      type: String
  field :email,         type: String
  field :date_of_birth, type: Date
  field :location,      type: String
  field :occupation,    type: String
end