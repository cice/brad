class User
  include Mongoid::Document

  field :firstname,     type: String
  field :lastname,      type: String
  field :email,         type: String
  field :date_of_birth, type: Date
  field :location,      type: String
  field :occupation,    type: String
  field :active,        type: Boolean
  field :level,         type: Integer

  validates_presence_of :firstname
end
