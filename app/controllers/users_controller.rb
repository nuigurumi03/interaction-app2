class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @profile = Profile.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @profile = Profile.find(params[:id])
    # if @user.user_id == current_user.id
  end

end
