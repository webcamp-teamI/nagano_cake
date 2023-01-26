class Public::ItemsController < ApplicationController
  def index
    @item = Item.new
    # @items = Item.all
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @Cart = Cart.new
  end

end
