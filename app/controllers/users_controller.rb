class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # @user = User.find(current_user.id)
    # @icon = Icon.find(params[:id])
  end

end
