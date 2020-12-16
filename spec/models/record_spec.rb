require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.build(:record)
  end

  describe 'ファイル作成' do
    context 'ファイル作成がうまくいくとき' do
      it 'image,folder_idが存在するとき' do
        expect(@record).to be_valid
      end

      it 'titleが存在しなくてもファイルが作成できること' do
        @record.title = nil
        expect(@record).to be_valid
      end

      it 'captionが存在しなくてもファイルが作成できること' do
        @record.caption = nil
        expect(@record).to be_valid
      end
    end

    context 'ファイル作成がうまくいかないとき' do
      it 'imageが空では登録できない' do
        @record.image = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("Image can't be blank")
      end

      it 'folder_idが紐づいてないと登録ができない' do
        @record.folder = nil
        @record.valid?
        expect(@record.errors.full_messages).to include('Folder must exist')
      end
    end
  end
end
