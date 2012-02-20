require 'spec_helper'

describe BradViews::Forms::Helper, :type => :helper do

  it '#search_form_for should render a form with .form-search' do
    object = mock_model "User", :name => 'Max'

    html = helper.search_form_for object, :url => '' do |f|
      template.concat f.search_field :name
    end

    html.should have_selector('form.form-search input.search-query[@type="search"]')
  end

  it '#horizontal_form_for should render a form with .form-horizontal' do
    object = mock_model "User", :name => 'Max'

    html = helper.horizontal_form_for object, :url => '' do |f|
    end

    html.should have_selector('form.form-horizontal')
  end

  it '#form_for should render a form with .form-vertical' do
    object = mock_model "User", :name => 'Max'

    html = helper.form_for object, :url => '' do |f|
    end

    html.should have_selector('form.form-vertical')
  end
end
