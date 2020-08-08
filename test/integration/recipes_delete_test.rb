require 'test_helper'

class RecipesDeleteTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = Chef.create!(chefname: "Antony Bourdain", email: "tony@example.com",
                          password: "password", password_confirmation: "password")
    @recipe = Recipe.create(name: "Vegetable potstickers", description: "Lightly fry the vegetables minced inside after dipping in batter", chef: @user)
  end

  test "successfully delete a recipe" do
    sign_in_as(@user)
    get recipe_path(@recipe)
    assert_template 'recipes/show'
    assert_select 'a[href=?]', recipe_path(@recipe), text: 'Delete recipe'
    assert_difference "Recipe.count", -1 do
      delete recipe_path(@recipe)
    end
    assert_redirected_to recipes_path
    assert_not flash.empty?
  end
end
