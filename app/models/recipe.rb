class Recipe < ApplicationRecord
  has_many :photos
  has_one :main_photo, class_name: 'Photo'
end
