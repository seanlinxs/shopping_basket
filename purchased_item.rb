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

  def imported?
    TaxClassifier::IMPORTED.include?(self.name)
  end

  def sales_tax
    if tax_exempt?
      if imported?
        tax_rate = 0.05
      else
        tax_rate = 0
      end
    else
      if imported?
        tax_rate = 0.15
      else
        tax_rate = 0.1
      end
    end

    # round up to nearest 0.05
    (qty * price * tax_rate * 20).ceil / 20.0
  end

  def price_including_tax
    (price * 100 + sales_tax * 100) / 100.0
  end

  def to_s
    "#{qty}, #{name}, #{price_including_tax}"
  end

end