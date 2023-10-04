class WishItem < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, allow_nil: true

  def formatted_price
    "£%.2f" % price
  end
end
