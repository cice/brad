require 'spec_helper'

describe Brad::Resources::View::TableHelpers, :type => :helper do
  let(:test_resources) do
    3.times.map do |i|
      TestResource.create :test_field_a => (i + 1).ordinalize, :test_int => i
    end
  end

  let(:options) do
    {}
  end

  let(:block) do
    proc { |t| }
  end

  subject do
    helper.table_for test_resources, {:as => :test_resources}.merge!(options), &block
  end

  describe 'a simple table' do
    it { should have_selector 'table.test_resources thead' }
    it { should have_selector 'table.test_resources tbody' }
    it { should have_selector "table.test_resources tbody tr.test_resource[data-id='#{test_resources.first.id}']"}
  end

  describe 'provide an id' do
    let(:options) { {:id => 'foo_bars'} }

    it { should have_selector 'table.test_resources#foo_bars' }
  end

  describe 'string columns' do
    let(:block) do
      proc do |t|
        t.string :test_field_a
      end
    end

    it { should have_selector('tbody tr.test_resource td.test_field_a.alpha-numeric', :content => '1st') }
    it { should have_selector('tbody tr.test_resource td.test_field_a.alpha-numeric', :content => '2nd') }
    it { should have_selector('tbody tr.test_resource td.test_field_a.alpha-numeric', :content => '3rd') }
  end

  describe 'numeric columns' do
    let(:block) do
      proc do |t|
        t.numeric :test_int
      end
    end

    it { should have_selector('tbody tr.test_resource td.test_int.numeric', :content => '0') }
    it { should have_selector('tbody tr.test_resource td.test_int.numeric', :content => '1') }
    it { should have_selector('tbody tr.test_resource td.test_int.numeric', :content => '2') }
  end

  describe 'helper columns' do
    let(:test_resources) do
      [ TestResource.create(:test_field_a => 'Once upon a time in a world far far away', :test_int => 1) ]
    end

    let(:block) do
      proc do |t|
        t.truncate :test_field_a
      end
    end

    it { should have_selector('td.test_field_a.alpha-numeric', :content => 'Once upon a time in a world...') }

    describe 'helper options' do
      let(:block) do
        proc do |t|
          t.truncate :test_field_a, :helper => { :length => 17 }
        end
      end

      it { should have_selector('td.test_field_a.alpha-numeric', :content => 'Once upon a ti...') }
    end

    describe 'numeric helpers' do
      let(:block) do
        proc do |t|
          t.number_with_precision :test_int
        end
      end

      it { should have_selector('td.test_int.numeric', :content => '1.000') }
    end

    describe 'table heads' do
      let(:block) do
        proc do |t|
          t.string :test_field_a
        end
      end

      it { should have_selector('thead tr th.alpha-numeric', :content => 'test_field_a') }
    end
  end
end
