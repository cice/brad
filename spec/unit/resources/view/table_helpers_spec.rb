require 'spec_helper'

describe Brad::Resources::View::TableHelpers, :type => :helper do
  describe '#table_for' do
    let(:test_resources) { 3.times.map { TestResource.create } }
    
    it 'should use Bootstrap builder as default table builder' do
      helper.table_for(test_resources) do |t| 
        t.should be_a Brad::Resources::View::TableBuilders::Bootstrap
      end
    end
    
    it 'should return a string' do
      helper.table_for(test_resources).should be_a ActiveSupport::SafeBuffer
    end
  end
end
