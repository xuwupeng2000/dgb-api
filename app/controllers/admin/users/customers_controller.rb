class Admin::Users::CustomersController < Admin::Users::BaseController

  def index
    @customers = @user.customers
  end

  def new
    @customer = @user.customers.build
  end

  def edit
    @customer = @user.customers.find(params[:id])
  end

  def update
    @customer = @user.customers.find(params[:id])

    if @customer.update(customer_params)
      redirect_to admin_user_customers_path, notice: 'successed'
    else
      render :edit
    end
  end

  def create
    @customer = @user.customers.build(customer_params)

    if @customer.save
      redirect_to admin_user_customers_path, notice: 'successed'
    else
      render :new
    end
  end

  def destroy
    @customer = @user.customers.find(params[:id])
    @customer.destroy

    redirect_to admin_user_customers_path, notice: 'successed'
  end

  private 

  def customer_params
    params.require(:customer).permit!
  end

end
