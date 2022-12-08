class Review < ApplicationRecord
    belongs_to :student
    belongs_to :teacher

    # validates :title, :rating, :comment, presence: true
    # validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 6 } #allows only numbers from 1 - 5 for ratings
end
