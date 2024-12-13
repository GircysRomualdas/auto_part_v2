class HomeController < ApplicationController
  def index
    if admin_signed_in?
      redirect_to admin_path
    elsif seller_signed_in?
      redirect_to seller_path
    end
  end
end
