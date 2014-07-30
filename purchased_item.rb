require 'bigdecimal'
require_relative 'tax_classifier'

class PurchasedItem
  attr_accessor :qty, :name, :price
  
  def initialize(qty, name, price)
    @qty = qty
    @name = name
    @price = price
  end

  include TaxClassifier

  def sales_tax
    # round up to nearest 0.05
    (qty * price * tax_rate * 20).ceil / 20.0
  end

  def price_including_tax
    (qty * BigDecimal(price.to_s) + BigDecimal(sales_tax.to_s)).to_f
  end

  def to_s
    "#{qty}, #{name}, %.2f" % price_including_tax
  end

end