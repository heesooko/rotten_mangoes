class Admin::UsersController < ApplicationController

  before_action :admins_only
  # before_action :some_other_filter

  def index
    @users = User.all
  end

  def preview
    # raise params.inspect
    @user = User.find params[:id]
    if revert_to_self?
      revert_to_self
    elsif session[:actual_user_id].blank?
      session[:actual_user_id] = current_user.id
    end

    session[:user_id] = @user.id
    redirect_to :back
  end

  protected

  # def admins_only
  #   unless current_user.admin?
  #     flash[:alert] = "Whoa! You no admin man!"
  #     redirect_to root_path
  #     return false
  #   end
  #   true
  # end

  def admins_only
    redirect_to :root, alert: "Whoa!!" unless admin?
  end

  def revert_to_self?
    @user.id == session[:actual_user_id]
  end

  def revert_to_self
    session[:actual_user_id] = nil
  end


  # def some_other_filter
  #   raise "hello"
  # end



end
