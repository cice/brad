require 'spec_helper'

describe Brad::View::AlertHelpers, :type => :helper do
  it 'should render an alert message' do
    buffer = helper.alert_msg :success, 'Hello', 'Foobar was great success!'

    buffer.should have_selector('.alert-message.success a.close[href="#"]', :content => 'x')
    buffer.should have_selector('.alert-message.success p strong', :content => 'Hello')
    buffer.should have_selector('.alert-message.success p', :content => 'Foobar was great success')
  end

  it 'should provide shortcut methods' do
    helper.should_receive(:alert_msg).with('success', 'hello', 'you!')

    helper.success_msg 'hello', 'you!'
  end

  it 'should use a block-message if block given' do
    buffer = helper.success_msg 'Hello', 'what happened?' do
      concat 'tell me!'
    end

    buffer.should have_selector('.alert-message.block-message.success', :content => 'tell me!')
  end
end
