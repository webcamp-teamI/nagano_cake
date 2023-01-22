class Public::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

#   private
#   def item_params
#     params.require(:item).permit(:image, :name, :detail, :tax_free,)
#   end
end
