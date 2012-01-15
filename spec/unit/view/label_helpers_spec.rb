require 'spec_helper'

describe Brad::View::LabelHelpers, :type => :helper do
  it 'should render a span label with a caption' do
    buffer = helper.span_label :success, 'great success!'

    buffer.should have_selector('span.label.success',
      :content => 'great success!')
  end

  it 'should provide shortcut helpers' do
    buffer = helper.success_label 'great success!'

    buffer.should have_selector('span.label.success',
      :content => 'great success!')
  end
end
