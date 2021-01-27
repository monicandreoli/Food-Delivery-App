class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

   def run
    while @running
      @current_user = @sessions_controller.sign_in
      while @current_user
        if @current_user.manager?
          route_manager_action
        else
          route_delivery_guy_action
        end
      end
    end
  end

  private

  def route_manager_action
    choice = display_manager_menu
    print `clear`
    manager_action(choice)
  end

  def display_manager_menu
    puts "------------------------------"
    puts "------------ MENU ------------"
    puts "------------------------------"
    puts "What do you want to do"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    puts "8 - Log out"
    puts "9 - Quit"
    print "> "
    gets.chomp.to_i
  end

  def manager_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 8 then @current_user = nil
    when 9 then 
      @current_user = nil
      @running = false
    else
      puts "Try again..."
    end
  end

  def route_delivery_guy_action
    choice = display_delivery_guy_menu
    print `clear`
    delivery_guy_action(choice)
  end

  def display_delivery_guy_menu
    puts "------------------------------"
    puts "------------ MENU ------------"
    puts "------------------------------"
    puts "What do you want to do"
    puts "1 - List all orders"
    puts "2 - Mark order as delivered"
    puts "8 - Log out"
    puts "9 - Quit"
    print "> "
    gets.chomp.to_i
  end

  def delivery_guy_action(choice)
    case choice
    when 1 then puts "TODO"
    when 2 then puts "TODO"
    when 8 then @current_user = nil
    when 9 then 
      @current_user = nil
      @running = false
    else
      puts "Try again..."
    end
  end
end