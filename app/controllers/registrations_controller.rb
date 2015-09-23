class RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def edit
    super
  end

  def update
    super
  end

  def create
    super
  end

  def update
    super
  end

  #Disabled
  def destroy
    redirect_to root_path
  end

  #Disabled
  def cancel
    redirect_to root_path
  end

  private

  def sign_up_params
    params.require(:user).permit!
  end

end
