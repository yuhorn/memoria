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
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'すでに存在するnicknameは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.nickname
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Nickname has already been taken')
    end
    it 'すでに存在するemailは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'nicknameは10文字以内でないと登録できない' do
      @user.nickname = 'abcdefjhijk'
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 10 characters)")
    end
    it 'passwordは半角英数字でないと登録できない' do
      @user.password = '１１１１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数字で入力してください。")
    end
    it 'passwordは6文字以上でないと登録できない' do
      @user.password = '11111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordと確認用passwordが異なると登録できない' do
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
