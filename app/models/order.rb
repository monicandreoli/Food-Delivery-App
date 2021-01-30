class Order
  # Data
  # - id -> Integer
  # - meal -> Meal object
  # - customer -> Customer object
  # - employee -> Employee object
  # - delivered -> Boolean

  # Behavior
  # - mask_as_delivered!

  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(atributes = {})
    @id = atributes[:id]
    @meal = atributes[:meal]
    @customer = atributes[:customer]
    @employee = atributes[:employee]
    @delivered = atributes[:delivered] || false
  end

  def delivered?
    @delivered
  end
end
