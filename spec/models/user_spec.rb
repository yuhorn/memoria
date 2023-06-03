require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameとemail、passwordと確認用passwordが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
    end
    it 'emailが空では登録できない' do
      @user.email = ''
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
    end
    it '確認用passwordが空では登録できない' do
      @user.encrypted_password = ''
    end
    it 'すでに存在するnicknameは登録できない' do
    end
    it 'すでに存在するemailは登録できない' do
    end
    it 'nicknameは10文字以内でないと登録できない' do
      @user.nickname = 'abcdefjhijk'
    end
    it 'passwordは半角英数字でないと登録できない' do
      @user.password = '１１１１１１'
    end
    it 'passwordは6文字以上でないと登録できない' do
      @user.password = '11111'
    end
  end
end
