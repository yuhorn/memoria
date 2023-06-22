class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :albums
  has_many :photos

  with_options presence: true do
    validates :nickname, length: {maximum: 10}, uniqueness: true
    validates :email, uniqueness: true
    validates :password, format: {with: /\A[a-z0-9]+\z/i, message: "は半角英数字で入力してください。"}, on: :create
  end
end
