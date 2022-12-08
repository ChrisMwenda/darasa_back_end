class Student < ApplicationRecord
    has_secure_password 
    
    has_many :reviews
    has_many :teachers, through: :reviews


validates :username, uniqueness: true
validates :username, presence: true, allow_nil: true 

# def self.create_from_omniauth(auth)
#     Student.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
#       u.username = auth['info']['name']
#       u.email = auth['info']['email']
#       u.password = SecureRandom.hex(16)
#     end
#   end

end