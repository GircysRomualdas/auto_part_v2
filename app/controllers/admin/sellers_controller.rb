class Admin::SellersController < AdminController
  before_action :set_seller, only: [ :show, :destroy ]

  def index
    @sellers = Seller.all
  end

  def show
  end

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)

    if @seller.save
      flash[:notice] = "Seller was seccessfully created"
    else
      flash[:alert] = "Failed to create seller"
    end

    redirect_to admin_sellers_path
  end

  def destroy
    if @seller.destroy
      flash[:notice] = "Car seller was seccessfully deleted"
    else
      flash[:alert] = "Failed to delete seller"
    end

    redirect_to admin_sellers_path
  end

  private
    def set_seller
      @seller = Seller.find(params[:id])
    end

    def seller_params
      params.require(:seller).permit(:email, :password, :password_confirmation)
    end
end
