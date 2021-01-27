class CustomersView
  def display(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name}, address: #{customer.address}"
    end
  end

  def ask_for_name
    puts "please provide a name:"
    gets.chomp
  end

  def ask_for_address
    puts "What is the address?"
    gets.chomp
  end
end