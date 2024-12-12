class Admin::CarPartsController < AdminController
  before_action :set_car_part, only: [ :show, :destroy ]

  def index
    @car_parts = CarPart.all
  end

  def show
  end

  def destroy
    if @car_part.destroy
      flash[:notice] = "Car part was seccessfully deleted"
    else
      flash[:alert] = "Failed to delete car part"
    end

    redirect_to admin_car_parts_path
  end

  private
    def set_car_part
      @car_part = CarPart.find(params[:id])
    end
end
