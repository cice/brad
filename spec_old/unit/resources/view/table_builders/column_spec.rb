require 'spec_helper'

describe Brad::Resources::View::TableBuilders::Column do
  it 'should use send to access values on a method' do
    object = TestResource.new :test_field_a => 'foo'
    column = described_class.new [:test_field_a]

    column.retrieve_value_from(object).should == 'foo'
  end

  it 'should fetch nested properties' do
    object = TestResource.new :test_field_a => 'foo'
    column = described_class.new [:test_field_a, :upcase]

    column.retrieve_value_from(object).should == 'FOO'
  end
end
