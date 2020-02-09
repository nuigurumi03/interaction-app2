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
    @user.update(user_params)
    if @user.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    # params.require(:user).permit(:nickname,:email,:password,:password_confirmation)
    params.require(:user).permit(:nickname, :email)
  end

  def profile_params
    params.require(:profile).permit(:birthyear,:birthmonth,:birthday,:family_name,:personal_name,:family_name_kana,:personal_name_kana,:postal_code,:prefecture_id,:city,:tel,:house_code,:bulid_name)
  end

end
