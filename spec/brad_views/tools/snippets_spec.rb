require 'spec_helper'

describe BradViews::Tools::Snippets do
  let :test_class do
    Class.new(described_class).tap do |clazz|
      clazz.send :define_method, :some_helper do
        "foobar"
      end
    end
  end

  let :template do
    mock 'template'
  end

  subject { test_class.new template }

  its(:some_helper) { should == 'foobar' }

  it 'should concat to template on bang methods' do
    template.should_receive(:concat).with('foobar')

    subject.some_helper!
  end
end
