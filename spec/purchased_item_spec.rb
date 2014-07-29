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

  describe "#food?" do
    it "knows whether it is food" do
      TaxClassifier::FOOD.each do |f|
        @food_item = PurchasedItem.new(1, f, 0.85)
        expect(@food_item).to be_food
      end
    end
  end
end