require 'spec_helper'

describe BradViews::Buttons, :type => :helper do
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
end
