class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delively_charge
  belongs_to :prefecture
  belongs_to :shipping_days
  belongs_to :user

  validates :image, :title, :explanation, :price, presence: true 
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true, message: 'out of setting range' }  
  validates :category_id, :situation_id, :delively_charge_id, :prefecture_id, :shipping_days_id, numericality: {other_than: 0 , message: "can't be blank"}

end
