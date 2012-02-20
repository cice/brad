require 'spec_helper'

describe BradViews::Forms::Search do
  let :template do
    ActionView::Base.new
  end

  let :object do
    mock "User", :name => 'Max'
  end

  subject do
    described_class.new "user", object, template, {}, proc{ |f| }
  end

  it 'search field should have no label' do
    html = subject.search_field 'name'

    html.should_not have_selector('label')
    html.should have_selector('input.search-query[@type="search"]')
  end

end
