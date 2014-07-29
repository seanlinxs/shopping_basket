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

  def book?
    TaxClassifier::BOOKS.include?(self.name)
  end

  def medical_product?
    TaxClassifier::MEDICAL_PRODUCTS.include?(self.name)
  end

  def tax_exempt?
    food? || book? || medical_product?
  end
end