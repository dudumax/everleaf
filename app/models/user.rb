class User < ApplicationRecord
     
     has_many :tasks
     has_secure_password
     validates :password, presence: true, length: { minimum: 6 }
     validates :email, presence: true, uniqueness: true
     validates :name, presence: true
end
