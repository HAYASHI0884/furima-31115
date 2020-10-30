class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :preparation_day

  has_one_attached :image

  validates :name, :introduction, :image, presence: true

  with_options presence: true, numericality:{greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/} do
    validates :price
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :item_condition_id
    validates :postage_payer_id
    validates :shipping_area_id
    validates :preparation_day_id
  end
end
