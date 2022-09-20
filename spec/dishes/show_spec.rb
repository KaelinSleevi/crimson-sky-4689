require 'rails_helper'


Rspec.describe 'When I visit the dishes show page' do
    before(:each) do
        @chef1 = Chef.create!(name: 'Grenadine')
        @dish1 = chef1.dishes.create!(name: 'fettucini', description: 'fettucini alfredo')
        @dish2 = chef1.dishes.create!(name: 'gnocci', description: 'red sauce cooked potatoes')
        
        @ingredient1 = Ingredient.create!(name: 'spaghetti noodles', calories: 241)
        @ingredient2 = Ingredient.create!(name: 'potatoes', calories: 110)
        @ingredient3 = Ingredient.create!(name: 'white sauce', calories: 300)
        @ingredient4 = Ingredient.create!(name: 'red sauce', calories: 280)
        
        DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient1.id)
        DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient2.id)
        DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingredient3.id)
        DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingredient4.id)
    end

    it 'I see the dishes name and description' do
        visit dish_path(dish1)

        expect(page).to have_content("Name: #{@dish1.name}")
        expect(page).to have_content("Description: #{@dish2.description}")
    end

    it 'And I see a list of ingredients for that dish' do
        visit dish_path(dish1)

        expect(page).to have_content("Ingredients:")
        expect(page).to have_content("#{@ingredient1.name}")
        expect(page).to have_content("#{@ingredient2.name}")
    end

    it ' And I see the chefs name' do
        visit dish_path(dish1)

        expect(page).to have_content("Chef: #{@chef1.name}")
    end
end