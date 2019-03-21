require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { dessert = Dessert.new("yummy",1,chef) }
  

  describe "#initialize" do

    it "sets a type" do
      expect(dessert.type).to eq("yummy")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(1)
    end

    it "starts ingredients as an empty array" do 
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do 

    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      dessert.add_ingredient("garlic")
      expect(dessert.ingredients[0]).to eq("garlic")

    end

  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
    end

    it "raises an error if the amount is greater than the quantity" do
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
    end
  end
end
