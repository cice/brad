require 'spec_helper'

describe BradViews::NavBar::NavBar do
  let :template do
    ActionView::Base.new
  end

  let :block do
    proc { |n| }
  end

  before do
    template.stub(:current_page?).and_return false
  end

  it 'basic navbar structure' do
    html = described_class.new(template) do |n|
      template.concat 'foo'
    end.to_html

    html.should have_selector('.navbar .navbar-inner .container', :content => 'foo')
  end

  it 'nav list' do
    html = described_class.new(template) do |n|
      template.concat n.list {
        template.concat 'foo'
      }
    end.to_html

    html.should have_selector('ul.nav', :content => 'foo')
  end

  it 'nav item' do
    html = described_class.new(template) do |n|
      template.concat n.list {
        template.concat n.link_to('foo', '#bar')
      }
    end.to_html

    html.should have_selector('ul.nav li a[@href="#bar"]')
  end

  it 'nav item for current_page' do
    template.stub(:current_page?).and_return true
    html = described_class.new(template) do |n|
      template.concat n.list {
        template.concat n.link_to('foo', '#bar')
      }
    end.to_html

    html.should have_selector('li.active a')
  end

  it 'nav dropdown' do
    html = described_class.new(template) do |n|
      template.concat(n.list {
        template.concat(n.dropdown('foo'){})
      })
    end.to_html

    html.should have_selector('li.dropdown a.dropdown-toggle[@data-toggle="dropdown"]')
    html.should have_selector('li.dropdown ul.dropdown-menu')
  end

end
