class Recipe < ApplicationRecord
  has_many :comments
  has_many :photos
  has_one :main_photo, class_name: 'Photo'
  belongs_to :user
end
