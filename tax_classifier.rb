require 'yaml'

module TaxClassifier
  FOOD = YAML::load(File.read('./config/food.yml'))
  BOOKS = YAML::load(File.read('./config/books.yml'))
  MEDICAL_PRODUCTS = YAML::load(File.read('./config/medical_products.yml'))
  IMPORTED = YAML::load(File.read('./config/imported.yml'))

  def food?
    FOOD.include?(self.name)
  end

  def book?
    BOOKS.include?(self.name)
  end

  def medical_product?
    MEDICAL_PRODUCTS.include?(self.name)
  end

  def tax_exempt?
    food? || book? || medical_product?
  end

  def imported?
    IMPORTED.include?(self.name)
  end

  def tax_rate
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
  end
  
end