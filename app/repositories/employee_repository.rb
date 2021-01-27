require_relative '../models/employee'
require_relative 'base_repository'

class EmployeeRepository < BaseRepository
  undef_method :create

  def build_element(row)
    row[:id] = row[:id].to_i
    @elements << Employee.new(row)
  end

  def csv_header
    %w[id username password role]
  end

  def csv_row(employee)
    [employee.id, employee.username, employee.password, employee.role]
  end

  def find_by_username(username)
    @elements.find { |employee| employee.username == username }
  end

  def all_delivery_guys
    all.select { |employee| employee.delivery_guy? }
  end
end