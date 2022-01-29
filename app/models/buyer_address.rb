class BuyerAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :block_number, :building_name,:telephone_number, :user_id, :item_id, :token
with_options presence: true do
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, :city, :block_number, :user_id, :item_id, :token
  validates :telephone_number, numericality: {with: /\A{10,11}\z/, message: "is invalid.Input half-width characters"}
end
validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
validates :telephone_number, format: {with: /\A\d{10,11}\z/}

  def save
    buyer = Buyer.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block_number: block_number, building_name: building_name, telephone_number: telephone_number,buyer_id: buyer.id)
  end
end