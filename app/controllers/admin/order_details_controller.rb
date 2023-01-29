class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
    @order_detail.update(order_detail_params)
    if @order_details.where(make_status: 2).count >= 1
      @order.status = 2
      @order.save
    end
    if @order_details.where(make_status: 3).count == @order_details.count
      @order.status = 3
      @order.save
    end
    redirect_to admin_order_path(@order.id)
  end 
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:make_status)
  end
end 
