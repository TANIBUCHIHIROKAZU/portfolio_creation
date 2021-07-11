class Admin::CustomersController < ApplicationController
  
  def index
    @customer = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def memory_index
    @customer = Customer.find(params[:id])
    @memory = @customer.memories
    @memory_public = @memory.where(status: :public)
    @memory_follower_only = @memory.where(status: :follower_only)
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render :show
    end
  end
  
private
  def customer_params
    params.require(:customer).permit(:name, :email, :is_active, :customer_number, :plan)
  end
  
end