class DrinkLiquor < ApplicationRecord
  belongs_to :drink
  belongs_to :liquor
  
  validates :drink, presence: true
  validates :liquor, presence: true
end
