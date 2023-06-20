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
  end
end