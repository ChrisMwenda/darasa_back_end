class Teacher < ApplicationRecord
    searchkick
    belongs_to :student
    has_many :reviews
    has_many :students, through: :reviews

    has_attached_file :image, styles: { medium: "400x600>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
