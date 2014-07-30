require_relative 'shopping_basket'
require_relative 'purchased_item'
require_relative 'items_scanner'

shopping_basket = ShoppingBasket.new(items: ItemsScanner.scan_items(ARGV[0]))
puts shopping_basket.receipt
