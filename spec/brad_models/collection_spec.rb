require 'spec_helper'

describe BradModels::Collection do
  it '.new should extend given array' do
    some_model = Class.new
    array = [1, 2]
    collection = described_class.new array, some_model

    collection.should == array
    collection.model.should == some_model
  end
end
