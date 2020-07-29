require 'test_helper'

class RecipesEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = Chef.create!(chefname: "Antony Bourdain", email: "tony@example.com",
                          password: "password", password_confirmation: "password")
    @recipe = Recipe.create(name: "Vegetable potstickers", description: "Lightly fry the vegetables minced inside after dipping in batter", chef: @user)
  end

  test "reject invalid recipe update" do
    get edit_recipe_path(@recipe)
    assert_template 'recipes/edit'
    patch recipe_path(@recipe), params: {recipe: {name: " ", description: "some description"}}
  
    assert_template 'recipes/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end  

  test "successfully edit a valid recipe" do
    get edit_recipe_path(@recipe)
    assert_template 'recipes/edit'
    updated_name = "updated recipe penne pasta"
    updated_description = "Updated: toss the cooked pasta in olive oil and add with saute'ed vegetables."
    patch recipe_path(@recipe), params: {recipe: {name: updated_name, description: updated_description}}
    assert_redirected_to @recipe #same as follow_redirect!
    assert_not flash.empty?
    @recipe.reload
    assert_match updated_name, @recipe.name
    assert_match updated_description, @recipe.description
  end
end