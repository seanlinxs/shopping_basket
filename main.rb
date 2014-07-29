$: << './spec'
require 'spec_helper'

shopping_basket = ShoppingBasket.new(items: scan_items(ARGV[0]))
puts shopping_basket.receipt
