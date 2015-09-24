class Admin::Users::OrdersController < Admin::Users::BaseController

  def index
    @orders = @user.orders
  end

  def new
    @order = @user.orders.build
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      redirect_to admin_user_orders_path, notice: 'successed'
    else
      render :edit
    end
  end

  def create
    @order = @user.orders.build

    if @order.save
      redirect_to admin_user_orders_path, notice: 'successed'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit!
  end

end
