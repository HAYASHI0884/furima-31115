class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :item_condition, :postage_payer, :preparation_day, :shipping_area

  has_one_attached :image

  validates :name, :introduction, :price, :user, :category, :item_condition, :postage_payer, :preparation_day, :shipping_area, presence: true, unless: :was_attached?
  def was_attached?
    self.image.attached?
  end
  validates :category_id, :item_condition_id, :postage_payer_id, :shipping_area_id, :preparation_day_id, numericality: { other_than: 1 }
end
