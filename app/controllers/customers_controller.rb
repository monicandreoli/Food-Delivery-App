require_relative '../views/customers_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    # As a user I can list all customers
    # take the list -> repository
    customers = @customer_repository.all
    # display to the user -> view
    @customers_view.display(customers)
  end

  def add
    # As a user I can add a meal
    # Ask user for input: name, price -> View
    name = @customers_view.ask_for_name
    address = @customers_view.ask_for_address

    # Make a new meal from the input
    new_customer = Customer.new(name: name, address: address)
    # Store my new meal inside the repository -> Repository
    @customer_repository.create(new_customer)
  end
end