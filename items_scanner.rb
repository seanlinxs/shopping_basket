require 'csv'

module ItemsScanner

  def ItemsScanner.scan_items(input_file)
    items = []
    CSV.foreach(input_file) do |row|
      next if row == ["Quantity"," Product"," Price"]
      qty, name, price = row 
      qty = qty.to_i
      name = name.strip
      price = price.to_f
      items << PurchasedItem.new(qty, name, price)
    end
    items
  end

end