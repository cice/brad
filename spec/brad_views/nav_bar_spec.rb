require 'spec_helper'

describe BradViews::NavBar, :type => :helper do
  before do
    helper.stub(:current_page?).and_return false
  end

  it 'basic navbar structure' do
    html = helper.nav_bar do
    end

    html.should have_selector('.navbar .navbar-inner .container')
  end

  it 'nav list' do
    html = helper.nav_list do
    end

    html.should have_selector('ul.nav')
  end

  it 'nav item' do
    html = helper.nav_link_to 'foo', '#bar'

    html.should have_selector('li a[@href="#bar"]')
  end

  it 'nav_item for current_page' do
    helper.stub(:current_page?).and_return true
    html = helper.nav_link_to 'foo', '#bar'

    html.should have_selector('li.active a')
  end

  it 'nav_dropdown' do
    html = helper.nav_dropdown 'Action' do
    end

    html.should have_selector('li.dropdown a.dropdown-toggle[@data-toggle="dropdown"]')
    html.should have_selector('li.dropdown ul.dropdown-menu')
  end

  it 'drop_link_to' do
    html = helper.drop_link_to 'Action', '#'

    html.should have_selector('li a', :content => 'Action')
  end

end
