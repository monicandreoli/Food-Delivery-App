require_relative '../views/sessions_view'
class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    # Ask our user for username -> View
    username = @view.ask_for('username')
    # Ask our user for password -> View
    password = @view.ask_for('password')
    # Find employee from username -> Repository
    employee = @employee_repository.find_by_username(username)
    # Check if password is correct -> ?
    if employee && employee.password == password
      @view.welcome(employee)
      return employee
    else
      @view.wrong_credentials
      sign_in # Recursive method
    end
  end
end
