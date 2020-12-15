require 'rails_helper'

RSpec.describe Folder, type: :model do
  before do
    @folder = FactoryBot.build(:folder)
  end

  describe 'フォルダ作成' do
    context 'フォルダ作成がうまくいくとき' do
      it 'name,imageが存在するとき' do
        expect(@folder).to be_valid
      end
    end

    context 'フォルダ作成がうまくいかないとき' do
      it 'imageが空では登録できない' do
        @folder.image = nil
        @folder.valid?
        expect(@folder.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録ができない' do
        @folder.name = ''
        @folder.valid?￥
        expect(@folder.errors.full_messages).to include("Item can't be blank")
      end
      it 'nameが10字以上だと登録ができない' do
        @folder.name = 'あああああああああああ'
        @folder.valid?
        binding.pry
        expect(@folder.errors.full_messages).to include("Name is too long (maximum is 10 characters)")
      end
    end
  end
end
