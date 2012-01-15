require 'spec_helper'

describe Brad::View::LayoutHelpers::Sections, :type => :helper do
  it 'should generate a section' do
    buffer = helper.section do
      concat content_tag(:div, "foobar")
    end
    
    buffer.should have_selector("section div", :content => 'foobar')
  end
  
  it 'should render page header' do
    buffer = helper.section "Bazz" do
      concat "foobar"
    end
    
    buffer.should have_selector('section div.page-header h1', :content => 'Bazz')
  end
  
  it 'should render sub-caption' do
    buffer = helper.section "Bazz", 'foobar' do
      concat "banana"
    end
    
    buffer.should have_selector('section div.page-header h1 small', :content => 'foobar')
  end
  
  it 'should pass options to content_tag' do
    buffer = helper.section :id => 'foo', :class => 'bar' do
      concat content_tag(:div, "foobar")
    end
    
    buffer.should have_selector("section div", :content => 'foobar')
  end
end