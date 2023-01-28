class Public::ItemsController < ApplicationController
  def index
    @item = Item.new
    # @items = Item.all
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @Cart = Cart.new
  end

end
