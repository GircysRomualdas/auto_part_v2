class CarPartController < ApplicationController
  def index
    @car_parts = CarPart.all
  end

  def show
    @car_part = CarPart.find(params[:id])
  end
end
