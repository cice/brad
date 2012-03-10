module BradViews
  module Buttons
    BUTTON_TYPES = %w(primary info success warning danger inverse)
    WHITE_ICON_TYPES = [:inverse, :primary, :info, :success, :warning, :danger]

    def icon type, *args
      options = args.extract_tag_options!.merge! :class => "icon-#{type}"
      label = args.first

      content_tag(:i, '', options) + label.to_s
    end

    def btn_to *args, &block
      html_options = args.extract_tag_options!
      html_options.merge! :class => 'btn'
      html_options.merge! :class => "btn-#{html_options[:type]}" if html_options[:type]
      html_options.merge! :class => "btn-#{html_options[:size]}" if html_options[:size]
      html_options.merge! :class => "disabled" if html_options[:disabled]
      html_options.merge! :class => 'active' if html_options[:active]

      args << html_options

      link_to *args, &block
    end

    BUTTON_TYPES.each do |type|
      class_eval <<-RUBY, __FILE__, __LINE__
        def #{type}_btn_to *args, &block
          options = args.extract_tag_options!.merge! :type => "#{type}"

          btn_to *(args << options), &block
        end
      RUBY
    end

    def icon_btn_to icon_type, *args
      options = args.extract_options!
      label, url = args
      label, url = nil, label unless url

      icon_options = {}
      icon_options[:class] = 'icon-white' if WHITE_ICON_TYPES.include?(options[:type])
      icon_html = icon icon_type, icon_options

      btn_to icon_html, url, options
    end

    def btn_toolbar options = {}, &block
      options = options.to_tag_options.merge! :class => 'btn-toolbar'

      content_tag :div, options, &block
    end

    def btn_group options = {}, &block
      options = options.to_tag_options.merge! :class => 'btn-group'

      content_tag :div, options, &block
    end

    def btn_dropdown_toggle label
      btn_to '#', :class => 'dropdown-toggle', :'data-toggle' => 'dropdown' do
        concat label + ' '
        concat content_tag(:span, '', :class => 'caret')
      end
    end

    def btn_dropdown label, options = {}, &block
      btn_group(options) do
        concat btn_dropdown_toggle label
        concat content_tag(:ul, :class => 'dropdown-menu', &block)
      end
    end

    def btn_splitdown label, url, options = {}, &block
      btn_group(options) do
        concat btn_to(label, url)
        concat btn_dropdown_toggle ''
        concat content_tag(:ul, :class => 'dropdown-menu', &block)
      end
    end
  end
end
