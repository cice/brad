require 'spec_helper'

describe BradViews::Tables::Builder do
  class User
    extend ActiveModel::Naming
  end

  let :template do
    ActionView::Base.new
  end

  let :options do
    {}
  end

  let :extended_collection do
    BradModels::Collection.new collection, User
  end

  subject do
    described_class.new 'users', extended_collection, template, options, block
  end

  describe 'a simple table' do
    let :collection do
      [
        mock('user1', :firstname => 'Max'),
        mock('user2', :firstname => 'Moritz')
      ]
    end

    let :block do
      proc do |schema|
        schema.string :firstname
      end
    end

    it 'should render a cell' do
      html = subject.render_cell subject.columns.first, collection.first

      html.should have_selector('td.firstname.alpha-numeric', :content => 'Max')
    end

    it 'should render a row' do
      html = subject.render_row collection.first

      html.should have_selector('tr.user td.firstname.alpha-numeric', :content => 'Max')
    end

    it 'should render a table' do
      subject.to_html.should have_selector('table.table tbody tr', :count => 2)
    end

    it 'should render a table head' do
      I18n.should_receive(:t).with("activerecord.attributes.user.firstname", {}).and_return "First Name"

      html = subject.render_head
      html.should have_selector('tr th.firstname.alpha-numeric', :content => 'First Name')
    end
  end
end
