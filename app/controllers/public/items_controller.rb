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


#   private
#   def item_params
#     params.require(:item).permit(:image, :name, :detail, :tax_free,)
#   end
end
