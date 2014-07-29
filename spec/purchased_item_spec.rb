require 'spec_helper'

describe PurchasedItem  do
  before(:each) do
    @purchased_item = PurchasedItem.new(qty: 1, name: "PurchasedItem", price: 12.49)
  end

  describe "#new" do
    it "takes 3 arguments and return a PurchasedItem instance" do
      @purchased_item.should be_instance_of(PurchasedItem)
    end
  end

  describe "#is_food?" do
    it "knows whether it is food" do
      @food_item = PurchasedItem.new(qty: 1, name: "chocolate bar", price: 0.85)
      @food_item.is_food?.should be_true
    end
  end
end