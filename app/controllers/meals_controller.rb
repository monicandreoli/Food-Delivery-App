require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(meals_repository)
    @meals_repository = meals_repository
    @meals_view = MealsView.new
  end

  def list
    # As a user I can list all meals
    # take the list -> repository
    meals = @meals_repository.all
    # display to the user -> view
    @meals_view.display(meals)
  end

  def add
    # As a user I can add a meal
    # Ask user for input: name, price -> View
    name = @meals_view.ask_for_name
    price = @meals_view.ask_for_price

    # Make a new meal from the input
    new_meal = Meal.new({ name: name, price: price })
    # Store my new meal inside the repository -> Repository
    @meals_repository.create(new_meal)
  end
end
