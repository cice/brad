require 'spec_helper'

describe Brad::Resources::View::FormHelpers, :type => :helper do
  describe '#form_for' do
    it 'should use Bootstrap builder as default form builder' do
      helper.form_for(TestResource.new) do |f|
        f.should be_a Brad::Resources::View::FormBuilders::Base
      end
    end
  end
end
