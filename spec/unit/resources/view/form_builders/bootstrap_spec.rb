require 'spec_helper'

describe Brad::Resources::View::FormHelpers, :type => :helper do
  describe 'plain inputs' do
    subject do
      helper.form_for TestResource.new do |f|
        concat f.plain_text_field :test_field_a
      end
    end
    
    it { should_not have_selector '.clearfix .input input#test_resource_test_field_a'}
    it { should have_selector 'input#test_resource_test_field_a' }
  end
  
  describe 'simple text field' do
    subject do
      helper.form_for TestResource.new do |f|
        concat f.text_field :test_field_a
      end
    end
    
    it { should have_selector '.clearfix .input input#test_resource_test_field_a'}
    it { should have_selector '.clearfix label' }
  end
  
  describe 'simple text area' do
    subject do
      helper.form_for TestResource.new do |f|
        concat f.text_area :test_field_a
      end
    end
    
    it { should have_selector '.clearfix .input textarea#test_resource_test_field_a'}
    it { should have_selector '.clearfix label' }
  end
  
  describe '#fieldset' do
    subject do
      helper.form_for TestResource.new do |f|
        f.fieldset "Foo" do
          concat f.text_field :test_field_a
          concat f.text_field :test_field_b
        end
      end
    end
    
    it { should have_selector('fieldset legend', :content => 'Foo') }
    it { should have_selector 'fieldset .clearfix .input input'}
  end
  
  describe 'prepended inputs' do
    subject do
      helper.form_for TestResource.new do |f|
        concat f.text_field(:test_field_b, :prepend => 'foo?')
      end
    end
    
    it { should have_selector('.clearfix .input .input-prepend span.add-on', :content => 'foo?')}
  end
  
  describe 'appended inputs' do
    subject do
      helper.form_for TestResource.new do |f|
        concat f.text_field(:test_field_b, :append => 'foo?')
      end
    end
    
    it { should have_selector('.clearfix .input .input-append span.add-on', :content => 'foo?')}
  end
  
  describe 'input prepended with checkbox' do
    subject do
      helper.form_for TestResource.new do |f|
        concat f.text_field(:test_field_b, :prepend => f.plain_check_box(:test_field_d))
      end
    end
    
    it { should have_selector('.clearfix .input .input-prepend span.add-on input[type="checkbox"]')}
  end
  
  describe '#primary_btn' do
    subject do
      helper.form_for TestResource.new do |f|
        concat f.primary_btn 'submit'
      end
    end
    
    it { should have_selector 'input.primary.btn' }
  end
  
  describe '#with_class' do
    subject do
      helper.form_for TestResource.new do |f|
        f.with_class 'span3' do
          concat f.text_field :test_field_a
          concat f.text_field :test_field_b
        end
        
        concat f.text_field :test_field_c
      end
    end
    
    it { should have_selector 'input.span3#test_resource_test_field_a' }
    it { should have_selector 'input.span3#test_resource_test_field_b' }
    it { should_not have_selector 'input.span3#test_resource_test_field_c' }
  end
end