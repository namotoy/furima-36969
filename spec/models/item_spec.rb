require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context "商品が保存できる場合" do
      it "全ての値が入力されていれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context "商品が保存できない場合" do
      it "商品画像がないと保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end     
      it "商品名がないと保存できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end     
      it "商品説明がないと保存できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end     
      it "商品カテゴリーの情報がないと保存できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end     
      it "商品状態の情報がないと保存できない" do
        @item.situation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end     
      it "配送料負担の情報がないと保存できない" do
        @item.delively_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delively charge can't be blank")
      end     
      it "発送元地域の情報がないと保存できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end     
      it "配送までの日数の情報がないと保存できない" do
        @item.shipping_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end     
      it "価格の情報がないと保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end          
      it "価格が¥300~¥9,999,999の場合のみ保存可能であること" do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
    end
  end
end
