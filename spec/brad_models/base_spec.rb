require 'spec_helper'

describe BradModels::Base do
  class ModelBase
    def self.to_a
      [1, 2]
    end
  end

  class SomeModel < ModelBase
    extend BradModels::Base
  end

  class AnotherModel < ModelBase
  end

  it 'should override #to_a to return an extend array' do
    records = SomeModel.to_a
    records.should be_an Array
    records.model.should == SomeModel
  end

  it 'should not override #to_a in other models' do
    records = AnotherModel.to_a
    records.should_not respond_to :model
  end
end
