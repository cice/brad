require 'spec_helper'

describe BradViews::Tables::Schema do
  it 'should register string columns' do
    columns = described_class.new(nil, proc { |schema|
      schema.string :firstname
    }).to_a

    columns.should be_an Array
    columns.first.should be_a BradViews::Tables::Column
    columns.first.key.should == :firstname
  end
end
