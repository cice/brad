require 'spec_helper'

describe BradViews::Forms::Horizontal do
  let :template do
    ActionView::Base.new
  end

  let :object do
    mock "User", :name => 'Max', :active => false
  end

  subject do
    described_class.new "user", object, template, {}, proc{ |f| }
  end

  it 'help should render a help-block p' do
    html = subject.help "some help"

    html.should have_selector('p.help-block', :content => 'some help')
  end
end
