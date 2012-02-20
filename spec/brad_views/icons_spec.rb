require 'spec_helper'

describe BradViews::Icons, :type => :helper do
  it 'should render an i tag' do
    html = helper.icon :glass

    html.should have_selector('i.icon-glass')
  end
end
