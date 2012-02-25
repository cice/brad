require 'spec_helper'

describe BradViews::Buttons, :type => :helper do
  it 'should render an i tag' do
    html = helper.icon :glass

    html.should have_selector('i.icon-glass')
  end

  describe '#btn_to' do
    it 'link_to(body, url, html_options = {}) signature' do
      html = helper.btn_to "Some Link", "google.de", :type => :primary

      html.should have_selector('a.btn.btn-primary[@href="google.de"]', :content => "Some Link")
    end

    it 'link_to(url, html_options = {}, &block) signature' do
      html = helper.btn_to "google.de", :type => :primary do
        helper.concat "Some Link"
      end

      html.should have_selector('a.btn.btn-primary[@href="google.de"]', :content => "Some Link")
    end
  end

  it '#icon_btn_to' do
    html = helper.icon_btn_to :refresh, '#'

    html.should have_selector('a.btn i.icon-refresh')
  end

  it '#icon_btn_to with label' do
    html = helper.icon_btn_to :refresh, ' Refresh', '#'

    html.should have_selector('a.btn i.icon-refresh')
    html.should have_selector('a.btn', :content => 'Refresh')
  end

  it '#icon_btn_to with type' do
    html = helper.icon_btn_to :refresh, '#', :type => :primary

    html.should have_selector('a.btn.btn-primary i.icon-refresh')
  end

  it '#icon_btn_to with type inverse' do
    html = helper.icon_btn_to :refresh, '#', :type => :inverse

    html.should have_selector('a.btn.btn-inverse i.icon-refresh.icon-white')
  end

  it '#btn_toolbar' do
    html = helper.btn_toolbar(:class => 'foo') do
      helper.concat helper.btn_to('bar', '#')
    end

    html.should have_selector('.btn-toolbar.foo .btn', :content => 'bar')
  end

  it '#btn_group' do
    html = helper.btn_group(:class => 'foo') do
      helper.concat helper.btn_to('bar', '#')
    end

    html.should have_selector('.btn-group.foo .btn', :content => 'bar')
  end

  it '#btn_dropdown' do
    html = helper.btn_dropdown("action", :class => 'foo') do
      helper.concat helper.content_tag(:li, 'bar')
    end

    toggle_selector = '.btn-group.foo .btn.dropdown-toggle[@data-toggle="dropdown"]'
    html.should have_selector(toggle_selector, :content => 'action')
    html.should have_selector(toggle_selector + ' span.caret')
  end

  it '#btn_splitdown' do
    html = helper.btn_splitdown("action", '#', :class => 'foo') do
      helper.concat helper.content_tag(:li, 'bar')
    end

    toggle_selector = '.btn-group.foo .btn.dropdown-toggle[@data-toggle="dropdown"] span.caret'
    btn_selector = '.btn-group.foo .btn'
    html.should have_selector(toggle_selector)
    html.should have_selector(btn_selector, :content => 'action')
  end
end
