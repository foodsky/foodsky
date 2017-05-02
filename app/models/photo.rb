class Photo < ApplicationRecord
  mount_uploader :file, PhotoUploader
  belongs_to :recipe
end
