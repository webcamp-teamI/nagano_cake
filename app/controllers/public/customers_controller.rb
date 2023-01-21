class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to customers_path
    else
     render:edit
    end
  end

  def destroy
  end

  def confirm
  end
  
  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :phone_number, :address_number, :email)
    end
  
end
