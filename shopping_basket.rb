require 'bigdecimal'

class ShoppingBasket
  attr_accessor :purchased_items

  def initialize(items: [])
    @purchased_items = items
  end

  def purchased_items
    @purchased_items || []
  end

  def total
    @purchased_items.map { |x| BigDecimal(x.price_including_tax.to_s) }.inject(:+).to_f
  end

  def sales_tax
    @purchased_items.map { |x| BigDecimal(x.sales_tax.to_s) }.inject(:+).to_f
  end

  def receipt
    output = ""
    purchased_items.each { |x| output << x.to_s << "\n"}
    output << "\n"
    output << "Sales Taxes: " << "%.2f" % sales_tax << "\n"
    output << "Total: " << "%.2f" % total << "\n"
  end
end