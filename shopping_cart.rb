# frozen_string_literal: true

require_relative 'product_manager'
require_relative 'shipping_service'

# A class to hold products that will be bought by the user
class ShoppingCart
  def initialize(food_coupon, technology_coupon, clothes_coupon)
    @contents = []
    @food_coupon = food_coupon
    @technology_coupon = technology_coupon
    @clothes_coupon = clothes_coupon
  end

  def add_product(product)
    # Read as "if not enough products, raise an exception"
    raise "There are not enough units of #{product.name}" unless ProductManager.enough_units(product)

    @contents << product
    product.stock -= 1
  end

  def checkout
    total = 0
    @contents.each do |product|
      case ProductManager.product_category(product)
      when Product::FOOD
        # Equivalent to if food_coupon apply 20% discount, else no discount
        price = @food_coupon ? 0.80 * product.price : product.price
      when Product::TECHNOLOGY
        price = @technology_coupon ? 0.95 * product.price : product.price
      when Product::CLOTHES
        price = @clothes_coupon ? 0.75 * product.price : product.price
      end
      if Date.today.strftime('%A') == 'Monday' && product.category == Product::TECHNOLOGY
        price *= 0.95
      end
      total += price
    end
    total
  end

  def send_to_adress(adress, city, country)
    # Just like the method says: send the products to the buyer
    ShippingService.send_shopping_cart(self, adress, city, country)
  end
end
