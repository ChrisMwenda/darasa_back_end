class Review < ApplicationRecord
    belongs_to :user
    validates :title,:teacher_name,:image_url, :comment, presence: true
    validates :comment, length: {minimum: 15}
end
