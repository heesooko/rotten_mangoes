class My::BaseController < ApplicationController

  before_filter :ensure_logged_in

  private 

  def ensure_logged_in
    redirect_to root_path, notice: 'Jerk!' unless current_user
  end

end
