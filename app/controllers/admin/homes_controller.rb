class Admin::HomesController < ApplicationController
    def top
        # @orders = Order.all 
        # @orders_list = Order.page(params[:page]).per(10)
        @orders = Order.all.page(params[:page]).per(10)
    end
end
