require 'spec_helper'

describe Brad::View::ButtonHelpers, :type => :helper do
  describe '#btn_to' do
    it 'should render a link with btn class' do
      buffer = helper.btn_to 'Foo', '#foo'

      buffer.should have_selector('a.btn[href="#foo"]', :content => 'Foo')
    end

    it 'should provide shortcut methods' do
      buffer = helper.primary_btn_to 'Foo', '#foo'

      buffer.should have_selector('a.btn.primary[href="#foo"]', :content => 'Foo')
    end
  end

  describe '#small_btn_to' do
    it 'should render a link with btn.small class' do
      buffer = helper.small_btn_to 'Foo', '#foo'

      buffer.should have_selector('a.btn.small[href="#foo"]', :content => 'Foo')
    end
  end
end
