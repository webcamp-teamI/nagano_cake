class Public::DeliveriesController < ApplicationController
  def index
    @deliverie = Delivery.all
  end

  def edit
    @deliverie = Delivery.find(params[:id])
  end

  def create
    @deliverie = Delivery.new(deliverie_params)
    @deliverie.save
    redirect_to deliveries_path
  end

  def update
    @deliverie = Delivery.find(params[:id])
    @deliverie.update(deliverie_params)
    flash[:notice] = "配送先更新は成功したよ🙃"
    redirect_to deliverie_path
  end

  def destroy
    @deliverie = Delivery.find(params[:id])
    @deliverie.destroy
    redirect_to deliveries_path
  end

  private
  def deliverie_params
    params.require(:delivery).permit(:address, :address_name, :address_number, :customer_id)
  end

end
