# frozen_string_literal: true

# A product from a specific category that can be bought
class Product
  FOOD = 0
  TECHNOLOGY = 1
  CLOTHES = 2

  attr_reader :name, :category, :price

  def initialize(name, price, category)
    @name = name
    @price = price
    @category = category
    @stock = 0
  end

  def restock(new_units, date, lot_number)
    @stock += new_units
  end
end
