require 'rails_helper'

RSpec.describe Album, type: :model do
  before do
    @album = FactoryBot.build(:album)
  end

  describe 'アルバム新規作成' do
    it 'titleが存在し、category_idが1以外であれば作成できる' do
      expect(@album).to be_valid
    end
    it 'titleが空では作成できない' do
      @album.title = ''
      @album.valid?
      expect(@album.errors.full_messages).to include("Title can't be blank")
    end
    it 'category_idが1だと作成できない' do
      @album.category_id = 1
      @album.valid?
      expect(@album.errors.full_messages).to include("Category を選択してください。")
    end
    it 'titleが20文字以下でないと作成できない' do
      @album.title = 'あああああああああああああああああああああ'
      @album.valid?
      expect(@album.errors.full_messages).to include("Title is too long (maximum is 20 characters)")
    end
  end
end