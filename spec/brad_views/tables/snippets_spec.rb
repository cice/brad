require 'spec_helper'

describe BradViews::Tables::Snippets do
  let :template do
    ActionView::Base.new
  end

  subject { described_class.new template }

  describe '#table_header' do
    it 'should render a thead tag' do
      subject.table_header("foo").should have_selector('thead', :content => 'foo')
    end

    it 'should render a thead tag with block' do
      subject.table_header{ template.concat 'foo' }.should have_selector('thead', :content => 'foo')
    end
  end

  describe '#table_footer' do
    it 'should render a tfoot tag' do
      subject.table_footer("foo").should have_selector('tfoot', :content => 'foo')
    end

    it 'should render a tfoot tag with block' do
      subject.table_footer{ template.concat 'foo' }.should have_selector('tfoot', :content => 'foo')
    end
  end

  describe '#table_body' do
    it 'should render a tbody tag' do
      subject.table_body("foo").should have_selector('tbody', :content => 'foo')
    end

    it 'should render a tbody tag with block' do
      subject.table_body{ template.concat 'foo' }.should have_selector('tbody', :content => 'foo')
    end
  end

  describe '#table_row' do
    it 'should render a tr tag' do
      subject.table_row("foo").should have_selector('tr', :content => 'foo')
    end

    it 'should render a tr tag with block' do
      subject.table_row{ template.concat 'foo' }.should have_selector('tr', :content => 'foo')
    end
  end

  describe '#table_cell' do
    it 'should render a td tag' do
      subject.table_cell("foo").should have_selector('td', :content => 'foo')
    end

    it 'should render a td tag with block' do
      subject.table_cell{ template.concat 'foo' }.should have_selector('td', :content => 'foo')
    end
  end

  describe '#table_cell with th option' do
    it 'should render a th tag' do
      subject.table_cell("foo", nil, true).should have_selector('th', :content => 'foo')
    end

    it 'should render a th tag with block' do
      subject.table_cell(nil, nil, true){ template.concat 'foo' }.should have_selector('th', :content => 'foo')
    end
  end

  describe '#table' do
    it 'should render a simple table' do
      html = subject.table 'foo', 'baz' do
        template.concat 'bar'
      end

      html.should have_selector('table.table thead', :content => 'foo')
      html.should have_selector('table.table tbody', :content => 'bar')
      html.should have_selector('table.table tfoot', :content => 'baz')
    end

    it 'should render a striped table' do
      html = subject.table(nil, nil, :striped => true){ template.concat 'foo' }

      html.should have_selector('table.table.table-striped tbody', :content => 'foo')
    end

    it 'should render a bordered table' do
      html = subject.table(nil, nil, :bordered => true){ template.concat 'foo' }

      html.should have_selector('table.table.table-bordered tbody', :content => 'foo')
    end

    it 'should render a condensed table' do
      html = subject.table(nil, nil, :condensed => true){ template.concat 'foo' }

      html.should have_selector('table.table.table-condensed tbody', :content => 'foo')
    end
  end
end
