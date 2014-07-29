require_relative '../purchased_item'
require_relative '../shopping_basket'
require_relative '../tax_classifier'
require 'csv'

def scan_items(input_file)
  items = []
  CSV.foreach(input_file) do |row|
    qty, name, price = row
    qty = qty.to_i
    name = name.strip
    price = price.to_f
    items << PurchasedItem.new(qty, name, price)
  end
  items
end