class CarModel < ApplicationRecord
  belongs_to :car_brand
  has_many :car_part
end
