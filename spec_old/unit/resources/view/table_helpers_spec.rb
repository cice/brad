require 'spec_helper'

describe Brad::Resources::View::TableHelpers, :type => :helper do
  describe '#table_for' do
    let(:test_resources) { 3.times.map { TestResource.create } }
    
    it 'should return a string' do
      helper.table_for(test_resources){ |t| }.should be_a ActiveSupport::SafeBuffer
    end
  end
end
