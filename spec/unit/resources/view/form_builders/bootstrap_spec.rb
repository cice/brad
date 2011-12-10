require 'spec_helper'

describe Brad::Resources::View::FormHelpers, :type => :helper do
  describe 'simple text field' do
    subject do
      helper.form_for TestResource.new do |f|
        f.text_field :test_field_a
      end
    end
    
    it { should have_selector '.clearfix .input input#test_resource_test_field_a'}
    it { should have_selector '.clearfix label' }
  end
  
  describe 'simple text area' do
    subject do
      helper.form_for TestResource.new do |f|
        f.text_area :test_field_a
      end
    end
    
    it { should have_selector '.clearfix .input textarea#test_resource_test_field_a'}
    it { should have_selector '.clearfix label' }
  end
  
  describe 'fieldset' do
    subject do
      helper.form_for TestResource.new do |f|
        f.fieldset "Foo" do
          f.text_field :test_field_a
        end
      end
    end
    
    it { should have_selector('fieldset legend', :content => 'Foo') }
    it { should have_selector 'fieldset .clearfix .input input'}
  end
  
  describe 'primary_btn' do
    subject do
      helper.form_for TestResource.new do |f|
        f.primary_btn 'submit'
      end
    end
    
    it { should have_selector 'input.primary.btn' }
  end
end