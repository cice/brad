class DemosController < ApplicationController
  helper BradViews::Helper

  def show
    render :action => params[:id]
  end
end
