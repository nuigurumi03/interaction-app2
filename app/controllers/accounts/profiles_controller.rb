class Accounts::ProfilesController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_profile
  before_action :set_user
  
  def edit
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html {
            redirect_to account_path,
            notice: "Profile was successfully updated."
        }
      else
          format.html {
              render :edit
          }
      end
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email)
  end

  def profile_params
    params.require(:profile).permit(:birthyear,:birthmonth,:birthday,:family_name,:personal_name,:family_name_kana,:personal_name_kana,:postal_code,:prefecture_id,:city,:tel,:house_code,:bulid_name)
  end

end
