class SessionsView
  def ask_for(something)
    puts "#{something}?"
    print "> "
    gets.chomp
  end

  def welcome(employee)
    puts "Hello, #{employee.username}"
  end

  def wrong_credentials
    puts 'Wrong credentials.....'
  end
end
