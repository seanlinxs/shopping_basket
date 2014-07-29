require 'spec_helper'

describe ShoppingBasket do

  before(:each) do
    @shopping_basket = ShoppingBasket.new(items: scan_items("spec/test_data/input.csv"))
  end

  describe "#new" do
    context "without parameters" do
      it "has no item" do
        shopping_basket = ShoppingBasket.new
        expect(shopping_basket.purchased_items).to eql([])
      end
    end

    context "with a file parameter" do
      it "has 5 items" do
        expect(@shopping_basket.purchased_items.size).to eql(5)
      end
    end
  end

  describe "#total" do
    it "returns correct total cost" do
      expect(@shopping_basket.total).to eql(73.87)
    end
  end

  describe "#sales_tax" do
    it "returns correct sales tax" do
      expect(@shopping_basket.sales_tax).to eql(6.3)
    end
  end

  describe "#receipt" do
    it "prints correct receipt" do
      shopping_basket = ShoppingBasket.new(items: scan_items("spec/test_data/input1.csv"))
      expect(shopping_basket.receipt).to eql("1, book, 12.49\n1, music cd, 16.49\n1, chocolate bar, 0.85\n\nSales Taxes: 1.50\nTotal: 29.83\n")
      shopping_basket = ShoppingBasket.new(items: scan_items("spec/test_data/input2.csv"))
      expect(shopping_basket.receipt).to eql("1, imported box of chocolates, 10.50\n1, imported bottle of perfume, 54.65\n\nSales Taxes: 7.65\nTotal: 65.15\n")
      shopping_basket = ShoppingBasket.new(items: scan_items("spec/test_data/input3.csv"))
      expect(shopping_basket.receipt).to eql("1, imported bottle of perfume, 32.19\n1, bottle of perfume, 20.89\n1, packet of headache pills, 9.75\n1, box of imported chocolates, 11.85\n\nSales Taxes: 6.70\nTotal: 74.68\n")      
    end
  end
end