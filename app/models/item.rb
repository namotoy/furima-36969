class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delively_charge
  belongs_to :prefecture
  belongs_to :shipping_days

  validates :title, :explanation, presence: true 

  validates :category_id, :situation_id,:delively_charge_id, :prefecture_id, :shipping_days_id, numericality: {other_than: 0 , message: "can't be blank"}
end
