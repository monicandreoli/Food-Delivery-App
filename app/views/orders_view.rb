class OrdersView
  def display(orders)
    orders.each do |order|
      puts "[] #{order.id} - Meal: #{order.meal.name} Customer #{order.customer.name} Delivery by: #{order.employee.username}"
    end
  end

  def ask_user_for_index
    puts "Select by index"
    puts "> "
    gets.chomp.to_i - 1
  end
end
