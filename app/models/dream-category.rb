class DreamCategory < ActiveRecord::Base
  belongs_to :dream
  belongs_to :category
end