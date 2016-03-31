class Admin::UsersController < ApplicationController

  before_filter :only_admins
  
  def index
    @users = User.order(created_at: :desc)
  end

  def impersonate
    @user = User.find params[:id]
    session[:actual_user_id] = session[:user_id]
    session[:user_id] = @user.id
    redirect_to admin_users_path
  end

  private 

  def only_admins
    redirect_to(root_path) unless admin?
  end

  def admin?
    current_user && (current_user.admin? || impersonating?)
  end

  def impersonating?
    if session[:actual_user_id].present?
      user = User.find(session[:actual_user_id])
      user.admin?
    else
      false
    end
  end

  helper_method :admin?, :impersonating?
  
end
