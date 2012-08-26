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

  describe 'retrieve values' do
    let :mock_object do
      mock 'mock_object', :foo => mock('foo', :bar => 'baz')
    end

    it 'should retrieve nested values via multiple keys' do
      subject.retrieve_value_from(mock_object).should == 'baz'
    end

    describe 'interacting with templates' do
      let :template do
        ActionView::Base.new
      end

      describe 'using block to render a value' do
        let :block do
          proc { |object| template.concat object.foo.bar + "zes" }
        end

        it 'should evaluate the block' do
          subject.retrieve_value_from(mock_object, template).should == 'bazzes'
        end
      end

      describe 'feeding value through a helper' do
        let :options do
          {
            :helper_name => :tag,
            :helper => [nil, true]
          }
        end

        it 'should call that helper with given args' do
          subject.render_value(mock_object, template).should == '<baz>'
        end
      end
    end
  end
end
