require_relative 'base_repository'
require_relative '../models/order'

class OrderRepository < BaseRepository
  def initialize(csv_file, meal_repo, customer_repo, employee_repo)
    @csv_file = csv_file
    @meal_repo = meal_repo
    @customer_repo = customer_repo
    @employee_repo = employee_repo
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def build_element(row)
    row[:id] = row[:id].to_i
    meal = @meal_repo.find(row[:meal_id].to_i)
    row[:meal] = meal
    customer = @customer_repo.find(row[:customer_id].to_i)
    row[:customer] = customer
    employee = @employee_repo.find(row[:employee_id].to_i)
    row[:employee] = employee
    row[:delivered] = row[:delivered] == "true"
    @elements << Order.new(row)
  end

  def csv_header
    %w[id delivered meal_id customer_id employee_id]
  end

  def csv_row(order)
    [order.id, order.delivered?, order.meal.id, order.customer.id, order.employee.id]
  end

  def undelivered_orders
    all.reject { |order| order.delivered? }
  end
end
