require 'active_support/concern'

module HelperSupport
  extend ActiveSupport::Concern

  included do
    before do
      template.class_eval do
        define_method(:protect_against_forgery?) { false }
        define_method(:current_page?) { |options| false }
      end
    end

    let :template do
      Class.new(ActionView::Base).
        send(:include, described_class).
        new
    end

    let :helper do
      template
    end
  end
end
