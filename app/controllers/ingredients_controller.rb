class IngredientsController < ApplicationController

    before_action :set_ingredient, only: [:show, :edit, :update]

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
            flash[:success] = "Ingredient was successfully created"
            redirect_to ingredient_path(@ingredient)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @ingredient.update(ingredient_params)
            flash[:success] = "Ingredient name was updated successfully"
    end

    def show
        @ingredient_recipes = @ingredient.recipes.paginate(page: params[:page], per_page: 5)
    end

    def index
        @ingredients = Ingredient.paginate(page: params[:page], per_page: 5)
    end

private

    def set_ingredient
        @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
end