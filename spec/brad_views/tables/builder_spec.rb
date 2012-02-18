require 'spec_helper'

describe BradViews::Tables::Builder do
  let :resource_name do
    'users'
  end

  let :collection do
    []
  end

  let :template do
    ActionView::Base.new
  end

  let :options do
    {}
  end

  let :block do
    proc {}
  end

  subject do
    described_class.new resource_name, collection, template, options, block
  end

end
