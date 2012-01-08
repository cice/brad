require 'spec_helper'

describe Brad::View::TagOptions do
  it 'should be a Hash' do
    described_class.new.should be_a Hash
  end

  it '#to_tag_options should return a TagOptions' do
    hash = {}

    hash.to_tag_options.should be_a described_class
  end

  it 'should merge classes' do
    tag_options = { :class => 'abc' }.to_tag_options

    merged_tag_options = tag_options.merge :class => 'def'
    merged_tag_options[:class].should == 'abc def'
  end

  it 'should merge! classes' do
    tag_options = { :class => 'abc' }.to_tag_options

    tag_options.merge! :class => 'def'

    tag_options[:class].should == 'abc def'
  end
end
