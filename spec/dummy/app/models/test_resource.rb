class TestResource
  include Brad::Resources::Model
  
  field :test_field_a, type: String, default: 'Foo'
  field :test_field_b, type: String, default: 'Bar'
  field :test_field_c, type: String, default: 'Baz'
  field :test_field_d, type: Boolean, default: true
  field :test_int,     type: Integer
end