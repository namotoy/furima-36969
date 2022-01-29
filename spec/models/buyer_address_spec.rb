require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buyer_address = FactoryBot.build(:buyer_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること(配送先の住所情報も購入の都度入力)' do
        expect(@buyer_address).to be_valid
      end

      it '建物名は空でも保存できること' do
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @buyer_address.post_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が「3桁ハイフン4桁」の半角文字列のみでないと保存できないこと' do
        @buyer_address.post_code = '123４５６７'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県を選択していないと保存できないこと' do
        @buyer_address.prefecture_id = 0
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @buyer_address.block_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Block number can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @buyer_address.telephone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号が9桁以下だと登録できないこと' do
        @buyer_address.telephone_number = '12345'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Telephone number is invalid')
      end

      it '電話番号が12桁以上だと登録できないこと' do
        @buyer_address.telephone_number = '123456789012345'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Telephone number is invalid')
      end

      it '電話番号に半角数字以外が含まれている場合は登録できないこと' do
        @buyer_address.telephone_number = '１１１１１１１１１１'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Telephone number is invalid.Input half-width characters')
      end

      it 'userが紐付いていないと保存できないこと' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空だと保存できないこと' do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
