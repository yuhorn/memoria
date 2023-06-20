require 'rails_helper'

RSpec.describe Photo, type: :model do
  before do
    @photo = FactoryBot.build(:photo)
  end

  describe '写真投稿' do
    it 'memo、date、imageが存在すれば作成できる' do
      expect(@photo).to be_valid
    end
    it 'memoが空では作成できない' do
      @photo.memo = ''
      @photo.valid?
      expect(@photo.errors.full_messages).to include("Memo can't be blank")
    end
    it 'dateが空では作成できない' do
      @photo.date = ''
      @photo.valid?
      expect(@photo.errors.full_messages).to include("Date can't be blank")
    end
    it 'imageが紐づいていないと作成できない' do
      @photo.image = nil
      @photo.valid?
      expect(@photo.errors.full_messages).to include("Image can't be blank")
    end
    it 'memoが10文字以下でないと作成できない' do
      @photo.memo = 'あああああああああああ'
      @photo.valid?
      expect(@photo.errors.full_messages).to include("Memo is too long (maximum is 10 characters)")
    end
  end
end