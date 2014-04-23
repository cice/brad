require 'spec_helper'

describe BradViews::Forms::Horizontal do
  let :template do
    ActionView::Base.new
  end

  let :errors do
    ActiveModel::Errors.new(nil)
  end

  let :object do
    mock_model "User", :name => 'Max', :active => false, :errors => errors
  end

  subject do
    described_class.new "user", object, template, {}
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

      html.should have_selector('.control-group .controls p.help-block', :content => 'cant be blank, at least 8 chars')
    end

    it 'should render control-group in error state' do
      html = subject.text_field :name

      html.should have_selector('.control-group.error')
    end
  end

  it 'help should render a help-block p' do
    html = subject.help "some help"

    html.should have_selector('p.help-block', :content => 'some help')
  end

  it 'text field should be rendered within control group' do
    html = subject.text_field :name

    html.should have_selector('.control-group label.control-label')
    html.should have_selector('.control-group .controls input')
  end
end
