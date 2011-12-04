require 'spec_helper'

describe Brad::Resources::Model do
  describe 'the module' do
    subject { described_class }
    
    it { should be_a Module }
  end
  
  describe 'a decorated model' do
    class SomeModel
      include Brad::Resources::Model
    end
    
    subject { SomeModel }
    
    its(:included_modules){ should include Mongoid::Document }
  end
end