require 'yaml'

module TaxClassifier
  FOOD = YAML::load(File.read('./config/food.yml'))
  BOOKS = YAML::load(File.read('./config/books.yml'))
  MEDICAL_PRODUCTS = YAML::load(File.read('./config/medical_products.yml'))
end