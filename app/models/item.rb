class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  has_one_attached :image

  def was_attached?
    self.image.attached?
  end

  validates :content, presence: true, unless: :was_attached?
  validates :title, :text, :genre, presence: true
  validates :genre_id, numericality: { other_than: 1 }
end
