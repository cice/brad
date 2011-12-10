class TestResource
  include Brad::Resources::Model
  
  field :test_field_a, type: String, default: 'Foo'
end