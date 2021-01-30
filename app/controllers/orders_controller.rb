require_relative '../views/orders_view'
require_relative '../views/meals_view'
require_relative '../views/customers_view'
require_relative '../views/employees_view'
require_relative '../models/order'

class OrdersController
  def initialize(order_repository, meal_repo, customer_repo, employee_repo)
    @order_repository = order_repository
    @meal_repo = meal_repo
    @customer_repo = customer_repo
    @employee_repo = employee_repo

    @orders_view = OrdersView.new
    @customers_view = CustomersView.new
    @employees_view = EmployeesView.new
    @meals_view = MealsView.new
  end

  def list
    # 1. Get all undelivered orders -> Repo
    undelivered_orders = @order_repository.undelivered_orders

    # 2. Display orders -> Send to view
    @orders_view.display(undelivered_orders)
  end

  def add
    # 1. Ask for meal
    meal = select_meal
    # 2. Ask for Customer
    customer = select_customer
    # 3. Ask for delivery guy
    delivery_guy = select_delivery_guy
    # 4. Create our ouder
    order = Order.new(meal: meal, customer: customer, employee: delivery_guy)
    # 5. Save to repository
    @order_repository.create(order)
  end

  def select_meal
    meals = @meal_repo.all
    @meals_view.display(meals)
    index = @orders_view.ask_user_for_index
    return meals[index]
  end

  def select_customer
    customers = @customer_repo.all
    @customers_view.display(customers)
    index = @orders_view.ask_user_for_index
    return customers[index]
  end

  def select_delivery_guy
    delivery_guys = @employee_repo.all_delivery_guys
    @employees_view.display(delivery_guys)
    index = @orders_view.ask_user_for_index
    return delivery_guys[index]
  end
end
