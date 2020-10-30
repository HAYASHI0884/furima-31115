class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  has_one_attached :image

  validates :name, :introduction, :category_id, :item_condition_id, :postage_payer_id, :shipping_area_id, :preparation_day_id, :image, presence: true

  with_options presence: true, format: { with: /\A[0-9]+\z/} do
    validates :price
  end

  vaildates :category_id, :item_condition_id, :postage_payer_id, :shipping_area_id, :preparation_day_id, numericality: { other_than: 1 }
end
