class MealsView
  def display(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} Euros: #{meal.price}"
    end
  end

  def ask_for_name
    puts "please provide a name:"
    gets.chomp
  end

  def ask_for_price
    puts "What is the price?"
    gets.chomp.to_i
  end
end