class User < ActiveRecord::Base
  has_many :dreams
  has_many :categories, through: :dreams
  
  has_secure_password
  
  
end