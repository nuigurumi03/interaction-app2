class UsersController < ApplicationController

  def index
    @user = User.find_by(id: params[:id])
    # @user = User.find(params[:id])
  end

end
