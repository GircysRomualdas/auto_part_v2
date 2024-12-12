class CarPart < ApplicationRecord
  belongs_to :car_model
  belongs_to :seller
  belongs_to :part_type
end
