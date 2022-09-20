require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  
  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "model methods" do
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

    it 'total_calories' do
      expect(@dish1.total_calories).to eq(541)
    end
  end
end