class Album < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_one_attached :album_image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :title, presence: true , length: {maximum: 20}
  validates :category_id, numericality: {other_than: 1, message: "を選択してください。"}
end