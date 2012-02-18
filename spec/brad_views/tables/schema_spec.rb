require 'spec_helper'

describe BradViews::Tables::Schema do
  it 'should register string columns' do
    columns = described_class.new(nil, proc { |schema|
      schema.string :firstname
    }).to_a

    columns.should be_an Array
    columns.first.should be_a BradViews::Tables::Column
    columns.first.key.should == 'firstname'
    columns.first.cell_class.should == 'firstname alpha-numeric'
  end

  it 'should register numeric columns' do
    columns = described_class.new(nil, proc { |schema|
      schema.numeric :age
    }).to_a

    columns.first.cell_class.should == 'age numeric'
  end

  it 'should register arbitrary columns as helper columns' do
    columns = described_class.new(nil, proc { |schema|
      schema.foobar :age
    }).to_a

    columns.first.helper_name.should == :foobar
  end
end
