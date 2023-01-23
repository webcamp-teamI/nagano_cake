class Public::CartsController < ApplicationController

  def index
    @carts = Cart.all
  end

  def update
     @cart = Cart.find(params[:id])
     @cart.update(cart_params)
     redirect_to carts_path
  end

  def destroy
     @cart = Cart.find(params[:id])
     @cart.destroy
     redirect_to carts_path
  end

  def destroy_all
     @carts = Cart.all
     @carts.destroy_all
     redirect_to carts_path
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.save
  end

  private

  def cart_params
      params.require(:cart).permit(:customer_id, :item_id, :count)
  end
end
