class Mixer < ApplicationRecord
    has_many :drink_mixers
    has_many :drinks, through: :drink_mixers
end
