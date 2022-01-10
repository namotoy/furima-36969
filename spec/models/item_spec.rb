require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context "商品が出品できる場合" do
      it "全ての値が入力されていれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context "商品が出品できない場合" do
      it "商品画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end     
      it "商品名がないと出品できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end     
      it "商品説明がないと出品できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end     
      it "商品カテゴリーの情報がないと出品できない" do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end     
      it "商品状態の情報がないと出品できない" do
        @item.situation_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end     
      it "配送料負担の情報がないと出品できない" do
        @item.delively_charge_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delively charge can't be blank")
      end     
      it "発送元地域の情報がないと出品できない" do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end     
      it "配送までの日数の情報がないと出品できない" do
        @item.shipping_days_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end     
      it "価格の情報がないと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end          
      it "価格が300円未満では出品できない" do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end
      it "価格が9_999_999円を超えると出品できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end
      it '価格が全角数字では出品できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = @user
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
