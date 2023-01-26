class Public::CartsController < ApplicationController

  def index
    @carts = current_customer.carts
  end

  def update
     @cart = Cart.find(params[:id])
     @cart.count = cart_params[:count].to_i
     @cart.update(count: @cart.count)
     redirect_to carts_path
  end

  def destroy
     @cart = Cart.find(params[:id])
     @cart.destroy
     redirect_to carts_path
  end

  def destroy_all
     @carts = current_customer.carts
     @carts.destroy_all
     redirect_to carts_path
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.customer_id=current_customer.id
    @cart_items=current_customer.carts.all
     @cart_items.each do |cart_item|
      if cart_item.item_id==@cart.item_id
      new_count = cart_item.count + @cart.count
      cart_item.update_attribute(:count, new_count)
      @cart.delete
      end
    end
    @cart.save
    redirect_to carts_path
  end

  private

  def cart_params
      params.require(:cart).permit(:customer_id, :item_id, :count)
  end
end
