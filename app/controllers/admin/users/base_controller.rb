class Admin::Users::BaseController < Admin::BaseController
  before_action :find_user

  protected

  def find_user
    @user = User.find(params[:user_id])

    redirect_to root_path, error: "user can't be found" unless @user
  end

end
