class Admin::Users::OrdersController < Admin::Users::BaseController

  def index
    @orders = @user.orders
  end

  def new
    @order = @user.orders.build
  end

  def edit
    @order = @user.orders.find(params[:id])
  end

  def update
    @order = @user.orders.find(params[:id])

    if @order.update(order_params)
      redirect_to admin_user_orders_path, notice: 'successed'
    else
      render :edit
    end
  end

  def create
    @order = @user.orders.build(order_params)

    if @order.save
      redirect_to admin_user_orders_path, notice: 'successed'
    else
      render :new
    end
  end

  def destroy
    @order = @user.orders.find(params[:id])
    @order.destroy!

    redirect_to admin_user_orders_path, notice: 'successed'
  end

  private

  def order_params
    params.require(:order).permit!
  end

end
