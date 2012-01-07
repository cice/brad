require 'spec_helper'

describe Brad::View::NavigationHelpers::TopBar, :type => :helper do
  let(:current_page) do
    '/buzz'
  end
  
  described_class.class_eval do
    define_method :current_page? do |options|
      current_page == options
    end
  end
  
  it 'should render basic scaffold' do
    buffer = helper.top_bar
    
    buffer.should have_selector('.topbar .topbar-inner .container')
  end
  
  it 'should render brand' do
    buffer = helper.top_bar 'foobar'
    
    buffer.should have_selector('.topbar .topbar-inner .container h3 a[href="#"]', :content => 'foobar')
  end
  
  it 'should render brand with url' do
    buffer = helper.top_bar 'foobar', '/baz'
    
    buffer.should have_selector('.topbar .topbar-inner .container h3 a[href="/baz"]')
  end
  
  it 'should render a nav list' do
    buffer = helper.nav_list do
      concat nav_link_to('foo', '/baz')
      concat nav_link_to('bar', '/buzz')
    end
    
    buffer.should have_selector('ul.nav li a[href="/baz"]', :content => 'foo')
    buffer.should have_selector('ul.nav li.active a[href="/buzz"]', :content => 'bar')
  end
  
  it 'should render a dropdown' do
    buffer = helper.nav_list do
      concat nav_down('Baz') {}
    end
    
    buffer.should have_selector('ul.nav li.dropdown a.dropdown-toggle', :content => 'Baz')
    buffer.should have_selector('ul.nav li.dropdown ul.dropdown-menu')
  end
end
