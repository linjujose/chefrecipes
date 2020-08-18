require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
    
    def setup
        @ingredient = Ingredient.new(name: "Basil")
    end

    test "should be valid" do
        assert @ingredient.valid?
    end

    test "Ingredient should be present" do
        @ingredient.name = " "
        assert_not @ingredient.valid?
    end

    test "Ingredient should be of valid length" do
        @ingredient.name = "sp"
        assert_not @ingredient.valid?
        @ingredient.name = "r" * 26
        assert_not @ingredient.valid?
    end

    test "Ingredient should be unique" do
        @ingredient.save
        ingredient2 = @ingredient.dup
        #ingredient2.save
        assert_not ingredient2.valid?
    end

    test "Ingredient name should be case insensitive" do
        @ingredient.save
        ingredient2 = @ingredient.dup
        ingredient2.name = @ingredient.name.upcase
        assert_not ingredient2.valid?
    end
    
end