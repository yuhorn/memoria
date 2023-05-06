class Album < ApplicationRecord
  belongs_to :user
  has_one_attached :album_image
end
