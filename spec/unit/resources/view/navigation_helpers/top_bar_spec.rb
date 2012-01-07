require 'spec_helper'

describe Brad::View::NavigationHelpers::TopBar, :type => :helper do
  it 'should render basic scaffold' do
    buffer = helper.top_bar
    
    buffer.should have_selector('.topbar .topbar-inner .container')
  end
  
  it 'should render brand' do
    buffer = helper.top_bar 'foobar'
    
    buffer.should have_selector('.topbar .topbar-inner .container h3 a[href="#"]', :content => 'foobar')
  end
end
