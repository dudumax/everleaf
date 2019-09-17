class User < ApplicationRecord
     paginates_per 3
     has_many :tasks
    
    validates :name, presence: true,length: { maximum: 30 }
    validates :email, presence: true,length: { maximum: 225 },
        format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
        
    before_validation { email.downcase! }

     
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
     
end
