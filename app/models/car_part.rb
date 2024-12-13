class CarPart < ApplicationRecord
  belongs_to :car_model
  belongs_to :seller
  belongs_to :part_type
  validates :quantity, numericality: { greater_than_or_equal_to: 0, message: "quantity must be zero or greater" }
  validates :price, numericality: { greater_than_or_equal_to: 0, message: "price must be zero or greater" }
end
