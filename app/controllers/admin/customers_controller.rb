class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page])
  end
    
  def show
    @customer = Customer.find(params[:id])
  end
    
  def edit
    @customer = Customer.find(params[:id])
  end
    
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(@customer)
     flash[:notice] = "You have updated book successfully."
     redirect_to admin_customers_path
    else
     render:edit
    end
  end
end
