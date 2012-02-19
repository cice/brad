require 'spec_helper'

describe BradViews::Forms::Snippets do
  let :template do
    ActionView::Base.new
  end

  subject { described_class.new template }

  describe '#control_group' do
    it 'should render a simple control-group' do
      html = subject.control_group "Some Label" do
        template.concat "Some Controls"
      end

      html.should have_selector(".control-group label.control-label", :content => "Some Label")
      html.should have_selector(".control-group .controls", :content => "Some Controls")
    end
  end

  it 'should render a help-block' do
    html = subject.help_block "Some Help"

    html.should have_selector("p.help-block", :content => "Some Help")
  end
end
