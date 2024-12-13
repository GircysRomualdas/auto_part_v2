class Seller::CarPartsController < SellerController
  before_action :set_car_part, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_seller!, only: [ :show, :edit, :update, :destroy ]

  def index
    @car_parts = CarPart.where(seller: current_seller)
  end

  def show
  end

  def new
    @car_part = CarPart.new
  end

  def edit
  end

  def create
    @car_part = current_seller.car_parts.new(car_part_params)

    if @car_part.save
      flash[:notice] = "Car part was seccessfully created"
    else
      flash[:alert] = "Failed to create car part"
    end

    redirect_to seller_car_parts_path
  end

  def update
    if @car_part.update(car_part_params)
      flash[:notice] = "Car part was seccessfully updated"
      render :show
    else
      flash[:alert] = "Failed to updated car part"
      render :edit
    end
  end

  def destroy
    if @car_part.destroy
      flash[:notice] = "Car part was seccessfully deleted"
    else
      flash[:alert] = "Failed to delete car part"
    end

    redirect_to seller_car_parts_path
  end

  private

    def authorize_seller!
      unless @car_part.seller == current_seller
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to seller_car_parts_path
      end
    end

    def set_car_part
      @car_part = CarPart.find(params[:id])
    end

    def car_part_params
      params.require(:car_part).permit(:name, :description, :price, :quantity, :car_model_id, :part_type_id)
    end
end
