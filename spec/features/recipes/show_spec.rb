# User Story 2 - Recipes Show

# As a visitor,
# When I visit '/recipes/:id',
# Then I see the recipe's name, complexity and genre,
# and I see a list of the names of the ingredients for the recipe.
require "rails_helper"

RSpec.describe "/recipes/:id", type: :feature do
  describe "As a visitor, when I visit the recipe show page" do
    before(:each) do
      @recipe_1 = Recipe.create!(name: "Tacos", complexity: 2, genre: "Mexican")

      @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
      @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
      @ingredient_3 = Ingredient.create!(name: "Cheese", cost: 3)

      @recipe_1.ingredients << @ingredient_1
      @recipe_1.ingredients << @ingredient_2
      @recipe_1.ingredients << @ingredient_3
      
      visit "/recipes/#{@recipe_1.id}"
    end
    
    it "will display the recipe's name, complexity and genre and a list of the ingredients" do
      expect(page).to have_content(@recipe_1.name)
      expect(page).to have_content(@recipe_1.complexity)
      expect(page).to have_content(@recipe_1.genre)
    end

  end
end