require 'spec_helper'

describe BradViews::Forms::Basic do
  let :template do
    ActionView::Base.new
  end

  let :object do
    mock "User", :name => 'Max'
  end

  subject do
    described_class.new "user", object, template, {}, proc{ |f| }
  end

  it 'help should render a help-inline span' do
    html = subject.help "some help"

    html.should have_selector('span.help-inline', :content => 'some help')
  end

  it 'should render textfields with a label' do
    html = subject.text_field :name

    html.should have_selector('label[@for="user_name"]', :content => 'Name')
    html.should have_selector('input')
  end

  it 'submit etc should be buttons with btn class' do
    html = subject.submit 'Send'

    html.should have_selector('button.btn', :content => 'Send')
  end

  it 'typed buttons' do
    html = subject.primary_btn 'Send'

    html.should have_selector('button.btn-primary', :content => 'Send')
  end
end
