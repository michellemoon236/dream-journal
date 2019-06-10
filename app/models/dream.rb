class Dream < ActiveRecord::Base
  belongs_to :user
  has_many :dream_categories
  has_many :categories, through: :dream_categories
end