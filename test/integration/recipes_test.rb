require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = Chef.create!(chefname: "banarasi babu", email: "babu@example.com")
    @recipe = Recipe.create(name: "Vegetable tempura", description: "fry vegetables after dipping in batter", chef: @user)
    @recipe2 = @user.recipes.build(name: "Chicken sate", description: "Grill the chicken skewers and pour the sate paste")
    @recipe2.save
  end

  test "should get recipes index" do
    get recipes_url
    assert_response :success
  end

  test "should show recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_select "a[href=?]", recipe_path(@recipe), text: @recipe.name
    assert_select "a[href=?]", recipe_path(@recipe2), text: @recipe2.name
  end

  test "should get the show page" do
    get recipe_path(@recipe2)
    assert_template 'recipes/show'
    assert_match @recipe2.name, response.body
    assert_match @recipe2.description, response.body
    assert_match @user.chefname, response.body
  end

  test "create new valid recipe" do
    get new_recipe_path
  end

  test "reject invalid recipe submissions" do
    get new_recipe_path
  end

end