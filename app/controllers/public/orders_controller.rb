class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @orders = current_customer
  end

  def check
    @order = Order.new(order_params)
    @cart_items = current_customer.carts
    @order.shipping_cost = 800
    @total = 0
    # 分岐を下記のコードで分けている０、１、２で
    if params[:order][:select_address] == "0"
       @order.address = current_customer.address
       @order.address_number = current_customer.address_number
       @order.address_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
       @address = Delivery.find(params[:order][:address_id])
       @order.address = @address.address
       @order.address_number = @address.address_number
       @order.address_name = @address.address_name
    elsif params[:order][:select_address] == "2"
       @deliverie = Delivery.new
       @deliverie.address = params[:order][:address]
       @deliverie.address_name = params[:order][:address_name]
       @deliverie.address_number = params[:order][:address_number]
       @deliverie.customer_id = current_customer.id
       @deliverie.save
       @order.address = @deliverie.address
       @order.address_number = @deliverie.address_number
       @order.address_name = @deliverie.address_name
    else
       render :new
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    cart = current_customer.carts.all # ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
    #@order = current_customer.orders.new(order_params)# 渡ってきた値を @order に入れます
    if @order.save!
      cart.each do |carts|
        order_detail = OrderDetail.new
        order_detail.item_id = carts.item.id
        order_detail.order_id = @order.id
        order_detail.count = carts.count
        # order_detail.order_payment = carts.subtotal
        order_detail.buy_in_tax = carts.item.with_tax_price
        order_detail.save
      end
    end
    redirect_to orders_complete_path
    cart.destroy_all
  end

  def index
    @orders = Order.all
  end

  def show
  end
  
    private
  def order_params
    params.require(:order).permit(:pay_style, :shipping_cost, :address, :address_number, :address_name, :payment)
  end
  
end
