require 'rails_helper'


RSpec.describe 'When I visit the chef ingredient show page' do
    before(:each) do
        @chef1 = Chef.create!(name: 'Grenadine')
        @dish1 = @chef1.dishes.create!(name: 'Fettucini', description: 'fettucini alfredo')
        @dish2 = @chef1.dishes.create!(name: 'Gnocci', description: 'red sauce cooked potatoes')
        
        @ingredient1 = Ingredient.create!(name: 'spaghetti noodles', calories: 241)
        @ingredient2 = Ingredient.create!(name: 'potatoes', calories: 110)
        @ingredient3 = Ingredient.create!(name: 'white sauce', calories: 300)
        @ingredient4 = Ingredient.create!(name: 'red sauce', calories: 280)
        
        DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
        DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient3.id)
        DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient2.id)
        DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient4.id)
    end

    it 'I can see a unique list of names of all the ingredients that this chef uses' do
        visit chef_ingredients_path(@chef1)

        expect(page).to have_content("#{@ingredient1.name}")
        expect(page).to have_content("#{@ingredient2.name}")
        expect(page).to have_content("#{@ingredient3.name}")
        expect(page).to have_content("#{@ingredient4.name}")
    end
end
