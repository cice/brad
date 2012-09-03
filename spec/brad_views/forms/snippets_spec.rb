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

      html.should have_selector(".control-group .controls", :content => "Some Controls")
    end

    it 'should apply states' do
      html = subject.control_group "Some Label", :warning do
        template.concat "Some Controls"
      end

      html.should have_selector(".control-group.warning")
    end
  end

  it 'input_prepend should render markup for prepended inputs' do
    html = subject.input_prepend "prepend this!" do
      template.concat "right before this"
    end

    html.should have_selector('.input-prepend .add-on', :content => 'prepend this!')
  end

  it 'input_append should render markup for appended inputs' do
    html = subject.input_append "append this!" do
      template.concat "right before this"
    end

    html.should have_selector('.input-append .add-on', :content => 'append this!')
  end

  it 'help_block should render a help-block' do
    html = subject.help_block "Some Help"

    html.should have_selector("p.help-block", :content => "Some Help")
  end
end
