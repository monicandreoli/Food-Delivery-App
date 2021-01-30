require_relative '../models/customer'
require_relative 'base_repository'

class CustomerRepository < BaseRepository
  def build_element(row)
    row[:id] = row[:id].to_i
    @elements << Customer.new(row)
  end

  def csv_header
    %w[id name address]
  end

  def csv_row(customer)
    [customer.id, customer.name, customer.address]
  end
end
