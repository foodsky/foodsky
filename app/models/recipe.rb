class Recipe < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_one :main_photo, class_name: 'Photo'
  belongs_to :user

end
