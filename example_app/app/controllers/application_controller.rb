class ApplicationController < ActionController::Base
  helper BradViews::Helper

  protect_from_forgery
end
