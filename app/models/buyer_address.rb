class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :block_number, :building_name,:telephone_number,:user_id
with_options presence: true do
  validates :postal_code, :prefecture, :city, :block_number, :telephone_number, presence: true
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :telephone_number, numericality: {with: /\A{10,11}\z/, message: "is invalid.Input half-width characters"}
end
validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  def save
    buyer = Buyer.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, block_number: block_number, building_name: building_name, telephone_number: telephone_number,buyer_id: buyer.id)
  end
end