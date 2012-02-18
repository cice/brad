require 'spec_helper'

describe BradViews::Tools::I18nScope do
  it 'should simply scope t(ranslate) calls and delegate to parent' do
    scope = described_class.new 'helpers'
    I18n.should_receive(:t).with("helpers.form", {})

    scope.t :form
  end

  it 'be able to create a nested scope' do
    scope = described_class.new 'helpers'
    nested_scope = scope.derive 'form'

    nested_scope.should be_a described_class
  end
end
