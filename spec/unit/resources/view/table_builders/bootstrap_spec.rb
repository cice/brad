require 'spec_helper'

describe Brad::Resources::View::TableHelpers, :type => :helper do
  let(:test_resources) do
    3.times.map { |i|
      TestResource.new :test_field_a => (i + 1).ordinalize
    }
  end
  
  let(:options) do
    {}
  end
  
  let(:block) do
    proc { |t| }
  end
  
  subject do
    helper.table_for test_resources, {:as => :test_resources}.merge!(options), &block
  end
  
  describe 'a simple table' do
    it { should have_selector 'table.test_resources thead' }
    it { should have_selector 'table.test_resources tbody' }
  end
  
  describe 'provide an id' do
    let(:options) { {:id => 'foo_bars'} }

    it { should have_selector 'table.test_resources#foo_bars' }
  end
  
  describe 'string columns' do
    let(:block) do
      proc do |t|
        t.string :test_field_a
      end
    end
    
    it { should have_selector('tbody tr.test_resource td.test_field_a', :content => '1st') }
    it { should have_selector('tbody tr.test_resource td.test_field_a', :content => '2nd') }
    it { should have_selector('tbody tr.test_resource td.test_field_a', :content => '3rd') }
  end
end
