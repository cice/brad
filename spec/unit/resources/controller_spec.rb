require 'spec_helper'

describe Brad::Resources::Controller do
  describe 'the module' do
    subject { described_class }
    
    it { should be_a Module }
  end
end