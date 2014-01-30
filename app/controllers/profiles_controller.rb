class ProfilesController < ApplicationController
  def edit
    #@user = User.find(params[:id])
    @user = current_user #User.find(session[:user_id])
    
  end

  def update
    @user = current_user

    if @user.update_attributes(user_params)
      redirect_to edit_profile_path, notice: "Success!"
    else
      render :edit
    end

  end

  protected

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email)
  end


end
