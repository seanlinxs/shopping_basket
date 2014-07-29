class PurchasedItem
  attr_accessor :qty, :name, :price
  
  def initialize(qty, name, price)
    @qty = qty
    @name = name
    @price = price
  end

  def food?
    TaxClassifier::FOOD.include?(self.name)
  end
end