# frozen_string_literal: true

# A class to manage communication from outsiders to products
class ProductManager
  def self.product_category(product)
    product.category
  end

  def self.enough_units(product)
    product.positive?
  end
end
