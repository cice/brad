class UsersController < ApplicationController
  inherit_resources

  def create
    create! do |succ, fail|
      succ.html { redirect_to :users }
    end
  end
end
