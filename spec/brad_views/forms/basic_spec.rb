require 'spec_helper'

describe BradViews::Forms::Basic do
  let :template do
    ActionView::Base.new
  end

  let :errors do
    ActiveModel::Errors.new(nil)
  end

  let :object do
    mock "User", :name => 'Max', :active => false, :errors => errors
  end

  subject do
    described_class.new "user", object, template, {}
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

  describe 'fields with errors' do
    let :errors do
      ActiveModel::Errors.new(nil).tap do |e|
        e.add :name, 'cant be blank'
        e.add :name, 'at least 8 chars'
      end
    end

    it 'should render errors as help text' do
      html = subject.text_field :name

      html.should have_selector('span.help-inline', :content => 'cant be blank, at least 8 chars')
    end
  end

  it 'submit etc should be buttons with btn class' do
    html = subject.submit 'Send'

    html.should have_selector('button.btn', :content => 'Send')
  end

  it 'typed buttons' do
    html = subject.primary_btn 'Send'

    html.should have_selector('button.btn-primary', :content => 'Send')
  end

  it 'button sizes' do
    html = subject.button 'Send', :size => 'small'

    html.should have_selector('button.btn.btn-small', :content => 'Send')
  end

  it 'checkboxes should be wrapped in a label tag' do
    html = subject.check_box :active

    html.should have_selector('label.checkbox input[@type="checkbox"]')
  end

  it 'inline checkboxes' do
    html = subject.inline_check_box :active

    html.should have_selector('label.checkbox.inline input[@type="checkbox"]')
  end

  it 'actions should render a form-actions div' do
    html = subject.actions do
      template.concat "some buttons"
    end

    html.should have_selector('div.form-actions', :content => 'some buttons')
  end

  it 'actions with size should set size for all butons' do
    html = subject.actions :size => :small do
      template.concat subject.button("Send")
    end

    html.should have_selector('.form-actions button.btn-small')
  end
end
