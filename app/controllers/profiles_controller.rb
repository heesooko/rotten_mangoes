class ProfilesController < ApplicationController

  def edit
    @user = current_user # from the session[:user_id]
    # render :edit
  end

  def update
    @user = current_user
    if @user.update(profile_params)
      redirect_to edit_profile_path, notice: 'Done!'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:email)
  end

end
