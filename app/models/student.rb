class Student < ApplicationRecord
    has_many :reviews
    has_many :teachers, through: :reviews
end
