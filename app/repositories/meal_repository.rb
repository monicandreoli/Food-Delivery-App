require_relative '../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository
  def build_element(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    @elements << Meal.new(row)
  end

  def csv_header
    %w[id name price]
  end

  def csv_row(meal)
    [meal.id, meal.name, meal.price]
  end
end
