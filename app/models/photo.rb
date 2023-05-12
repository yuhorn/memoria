class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :album
  has_one_attached :image

  with_options presence :true do
    validates :memo, length: {maximum: 10}
    validates :date
    validates :image, blob: {content_type: [:image, :audio, :video], size_range: 1..5.megabytes}
  end
end
