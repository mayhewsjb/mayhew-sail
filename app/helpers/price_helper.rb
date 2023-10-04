# app/helpers/price_helper.rb
module PriceHelper
  def format_price(price)
    "£%.2f" % price
  end
end
