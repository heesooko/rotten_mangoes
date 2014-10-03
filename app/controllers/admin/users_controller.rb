class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
  end

  # PUT /admin/users/:user_id/switch
  def switch

  end

end
