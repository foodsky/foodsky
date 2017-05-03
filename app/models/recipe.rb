class Recipe < ApplicationRecord
  has_many :photos
  has_one :main_photo, class_name: 'Photo'
  has_many :recipe_comment, -> { order "created_at DESC"}
  belongs_to :user
end
