class Category < ActiveRecord::Base
  has_many :dream_categories
  has_many :dreams, through: :dream_categories
end