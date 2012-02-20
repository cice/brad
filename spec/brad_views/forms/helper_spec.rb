require 'spec_helper'

describe BradViews::Forms::Helper, :type => :helper do
  before do
    template.class_eval do
      define_method(:protect_against_forgery?) { false }
    end
  end

  it '#form_for should render a form with .form-vertical' do
    object = mock_model "User", :name => 'Max'

    html = helper.form_for object, :url => '' do |f|
    end

    html.should have_selector('form.form-vertical')
  end
end
