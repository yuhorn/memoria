require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)
    end
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)
    end
    it 'passwordが空では登録できない' do
      user = FactoryBot.build(:user)
    end
    it '確認用passwordが空では登録できない' do
      user = FactoryBot.build(:user)
    end
    it 'すでに存在するnicknameは登録できない' do
      user = FactoryBot.build(:user)
    end
    it 'すでに存在するemailは登録できない' do
      user = FactoryBot.build(:user)
    end
    it 'nicknameは10文字以内でないと登録できない' do
      user = FactoryBot.build(:user)
    end
    it 'passwordは半角英数字でないと登録できない' do
      user = FactoryBot.build(:user)
    end
    it 'passwordは6文字以上でないと登録できない' do
      user = FactoryBot.build(:user)
    end
  end
end
