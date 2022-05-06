# frozen_string_literal: true

require_relative 'shopping_cart'
require_relative 'payments_service'

# A user of the application
class User
  def initialize(name)
    @name = name
    @address = nil
    @city = nil
    @country = nil
    @shopping_cart = ShoppingCart.new
    @payment_method = {} # Equivalent to Hash.new
  end

  def add_address(adress, city, country)
    @adress = adress
    @city = city
    @country = country
  end

  def add_product(product)
    @shopping_cart.add_product(product)
  end

  def add_payment_method(payment_method_alias, owner, bank, currency, number, cvc_code, expiration_date)
    @payment_methods[payment_method_alias] = [
      owner, bank, currency, number, cvc_code, expiration_date
    ]
  end

  def bill_payment_method(chosen_payment_method)
    # Calculate total price
    total_price = @shopping_cart.total_price

    # Bill credit card
    success = PaymentsService.bill_user(@payment_methods[chosen_payment_method], total_price)
    raise 'Credit card declined' unless success

    # Send shoppping cart to adress
    @shopping_cart.send_to_adress(@address, @city, @country)

    # Create a new empty car for this user
    @shopping_cart = ShoppingCart.new
  end
end
