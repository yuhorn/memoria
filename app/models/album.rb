class Album < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_one_attached :album_image

  with_options presence: true do
    validates :title, length: {maximum: 20}
    validates :category
  end
end