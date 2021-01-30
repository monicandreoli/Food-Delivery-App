class EmployeesView
  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1} - Name: #{employee.username}"
    end
  end
end
