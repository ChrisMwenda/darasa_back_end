class Teacher < ApplicationRecord
    belongs_to :user
    has_many :reviews
    has_many :students, through: :reviews
end
