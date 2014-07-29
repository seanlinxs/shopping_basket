require 'spec_helper'

describe PurchasedItem  do
  before(:each) do
    @purchased_item = PurchasedItem.new(1, "PurchasedItem", 12.49)
  end

  describe "#new" do
    it "takes 3 arguments and return a PurchasedItem instance" do
      expect(@purchased_item).to be_instance_of(PurchasedItem)
    end
  end

  describe "#qty" do
    it "returns correct qty value" do
      expect(@purchased_item.qty).to eql(1)
    end
  end

  describe "#name" do
    it "returns correct name" do
      expect(@purchased_item.name).to eql("PurchasedItem")
    end
  end

  describe "#price" do
    it "returns correct price" do
      expect(@purchased_item.price).to eql(12.49)
    end
  end

  describe "#food?" do
    it "knows whether it is food" do
      TaxClassifier::FOOD.each do |f|
        food_item = PurchasedItem.new(1, f, 0.85)
        expect(food_item).to be_food
      end
    end
  end

  describe "#book?" do
    it "knows whether it is book" do
      TaxClassifier::BOOKS.each do |b|
        book_item = PurchasedItem.new(1, b, 0.85)
        expect(book_item).to be_book
      end
    end
  end

  describe "#medical_product?" do
    it "knows whether it is medical_product" do
      TaxClassifier::MEDICAL_PRODUCTS.each do |m|
        medical_product_item = PurchasedItem.new(1, m, 0.85)
        expect(medical_product_item).to be_medical_product
      end
    end
  end

  describe "#tax_exempt?" do
    context "is food" do
      it "should be tax exempt" do
        random_food_index = rand(TaxClassifier::FOOD.size)
        food_item = PurchasedItem.new(1, TaxClassifier::FOOD[random_food_index], 0.85)
        expect(food_item).to be_tax_exempt
      end
    end

    context "is book" do
      it "should be tax exempt" do
        random_book_index = rand(TaxClassifier::BOOKS.size)
        book_item = PurchasedItem.new(1, TaxClassifier::BOOKS[random_book_index], 0.85)
        expect(book_item).to be_tax_exempt
      end
    end

    context "is medical product" do
      it "should be tax exempt" do
        random_medical_product_index = rand(TaxClassifier::MEDICAL_PRODUCTS.size)
        medical_product_item = PurchasedItem.new(1, TaxClassifier::MEDICAL_PRODUCTS[random_medical_product_index], 0.85)
        expect(medical_product_item).to be_tax_exempt
      end
    end
  end

  describe "#imported?" do
    it "knows whether it is imported" do
      TaxClassifier::IMPORTED.each do |i|
        imported_item = PurchasedItem.new(1, i, 0.85)
        expect(imported_item).to be_imported
      end
    end
  end

  describe "#sales_tax" do
    context "is not exempt" do

      context "is not imported" do
        it "returns correct tax with 10% rate" do
          item = PurchasedItem.new(1, "music cd", 14.99)
          expect(item.sales_tax).to eql(1.5)
          item = PurchasedItem.new(1, "music cd", 14.09)
          expect(item.sales_tax).to eql(1.45)
        end
      end

      context "is imported" do
        it "returns correct tax with 15% rate" do
          item = PurchasedItem.new(1, "imported bottle of perfume", 27.99)
          expect(item.sales_tax).to eql(4.2)
          item = PurchasedItem.new(1, "imported bottle of perfume", 47.50)
          expect(item.sales_tax).to eql(7.15)
        end
      end

    end

    context "is exempt" do

      context "is not imported" do
        it "returns correct tax with 10% rate" do
          item = PurchasedItem.new(1, "book", 12.49)
          expect(item.sales_tax).to eql(0.0)
          item = PurchasedItem.new(1, "chocolate bar", 0.85)
          expect(item.sales_tax).to eql(0.0)
        end
      end

      context "is imported" do
        it "returns correct tax with 15% rate" do
          item = PurchasedItem.new(1, "imported box of chocolates", 10.00)
          expect(item.sales_tax).to eql(0.5)
          item = PurchasedItem.new(1, "box of imported chocolates", 11.25)
          expect(item.sales_tax).to eql(0.6)
        end
      end

    end
  end

  describe "#to_s" do
    it "returns correct item detail" do
      item = PurchasedItem.new(1, "music cd", 14.99)
      expect(item.to_s).to eql("1, music cd, 16.49")
    end
  end

end