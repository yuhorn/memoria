class Album < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_one_attached :album_image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :title, presence: true , length: {maximum: 20}
  validates :category_id, numericality: {other_than: 1, message: "カテゴリーを選択してください。"}
end