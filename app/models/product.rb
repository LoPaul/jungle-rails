class Product < ActiveRecord::Base
  has_many :reviews
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def average_rating
    reviews.average(:rating)
  end

  def has_quantity?
    quantity != 0
  end
end
