class Public::ItemsController < ApplicationController
    before_action :authenticate_customer!,except: [:index, :show, :search] #ログインしてる状態でもindexとshowページは見れる状態
    
  def index
    @item = Item.new
    # @items = Item.all
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @Cart = Cart.new
  end

  def search

    if params[:name].present?
      @customers = Customer.looks(params[:search], params[:word])
    end
  end

end
