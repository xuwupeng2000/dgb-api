class Admin::UsersController < Admin::BaseController

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.save!

    redirect_to admin_users_path, notice: 'successed'
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)

    redirect_to admin_users_path, notice: 'successed'
  end

  def destroy
    redirect_to admin_users_path, notice: 'not support'
  end

  private

  def user_params
    if params.require(:user)[:password].present?
      params.require(:user).permit!
    else
      params.require(:user).permit!.except(:password, :password_confirmation)
    end
  end

end
