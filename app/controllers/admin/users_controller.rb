class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
  end

  # PUT /admin/users/:user_id/switch
  def switch
    @user = User.where(admin: [false, nil]).find(params[:id])
    session[:actual_user_id] = current_user.id
    session[:user_id] = @user.id
    redirect_to :back, notice: 'DoneZo!'
  end

end
