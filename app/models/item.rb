class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delively_charge
  belongs_to :prefecture
  belongs_to :shipping_days
  belongs_to :user

  validates :title, :explanation, :price, presence: true 
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  # validates :price, inclusion: {:in 300..9999999)

  validates :category_id, :situation_id, :delively_charge_id, :prefecture_id, :shipping_days_id, numericality: {other_than: 0 , message: "can't be blank"}
end
