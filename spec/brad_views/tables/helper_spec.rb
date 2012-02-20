require 'spec_helper'

describe BradViews::Tables::Helper, :type => :helper do

  it '#table_for should render a table' do
    object = mock "User", :name => 'Max'

    html = helper.table_for [object], :as => 'users' do |t|
      t.string :name
    end

    html.should have_selector('table.table.users')
  end
end
