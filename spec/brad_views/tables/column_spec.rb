require 'spec_helper'

describe BradViews::Tables::Column do
  let :keys do
    [ :foo, :bar ]
  end

  let :options do
    {
      :class => 'numeric'
    }
  end

  let :block do
    nil
  end

  subject do
    described_class.new keys, options, &block
  end

  its(:key) { should == 'foo_bar' }
  its(:cell_class) { should == 'foo_bar numeric' }

  describe 'column with helper and args' do
    let :options do
      {
        :helper_name => 'localize',
        :helper => helper_args
      }
    end

    describe 'Hash argument' do
      let :helper_args do
        { :foo => 'bar' }
      end

      it 'helper_args should be cloned' do
        subject.helper_args.should be_an Array
        subject.helper_args.first.should == { :foo => 'bar' }
        subject.helper_args.first.object_id.should_not == helper_args.object_id
      end
    end

    describe 'Array argument' do
      let :helper_args do
        [
          { :foo => 'bar' },
          'abc'
        ]
      end

      it 'should clone array and nested hashes' do
        subject.helper_args.should == helper_args
        subject.helper_args.object_id.should_not == helper_args.object_id
        subject.helper_args.first.object_id.should_not == helper_args.first.object_id
      end
    end

    describe 'nil argument' do
      let :helper_args do
        nil
      end

      it 'should return an empty array' do
        subject.helper_args.should == []
      end
    end

    describe 'anything else' do
      let :helper_args do
        'foobar'
      end

      it 'should be wrapped in an array' do
        subject.helper_args.should == [ 'foobar' ]
      end
    end

  end

end
