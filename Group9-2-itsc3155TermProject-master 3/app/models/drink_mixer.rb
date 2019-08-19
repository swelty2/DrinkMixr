class DrinkMixer < ApplicationRecord
  belongs_to :drink
  belongs_to :mixer
  
  validates :drink, presence: true
  validates :mixer, presence: true
end
