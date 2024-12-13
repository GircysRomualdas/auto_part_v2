class Admin::CustomersController < AdminController
  before_action :set_customer, only: [ :show, :destroy ]

  def index
    @customers = Customer.all
  end

  def show
  end

  def destroy
    if @customer.destroy
      flash[:notice] = "Car customer was seccessfully deleted"
    else
      flash[:alert] = "Failed to delete customer"
    end

    redirect_to admin_customers_path
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end
end
