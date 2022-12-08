class Teacher < ApplicationRecord
    belongs_to :student
    has_many :reviews
    has_many :students, through: :reviews

end
