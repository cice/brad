require 'spec_helper'

describe Brad::Resources::Model::Mongoid::Meta do
  let(:meta_model) { described_class.new TestResource }
  subject { meta_model }

  its(:model) { should be TestResource }
  its(:fields) { should be_an Array }

  its('fields.first') { should be_a Brad::Resources::Model::Mongoid::Field }

  describe 'a test field' do
    subject { meta_model.fields[2] }

    its(:name) { should == 'test_field_a' }
    its(:type) { should be String }
    its(:default) { should == 'Foo' }
  end

  describe 'private fields' do
    it '_id field should be private' do
      field = meta_model.fields.first

      field.name.should == '_type'
      field.private?.should be true
    end
  end
end
