class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def show
        recipe_by_id
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)

        #tentative - change after completing login part
        @recipe.chef = Chef.last

        if @recipe.save
            flash[:success] = "Recipe was created successfully"
            redirect_to recipe_path(@recipe)
        else
            render 'new'
        end
    end

    def edit
        recipe_by_id
    end

    def update
        recipe_by_id
        if @recipe.update(recipe_params)
            flash[:success] = "Recipe was updated successfully"
            redirect_to recipe_path(@recipe)
        else
            render 'edit'
        end
    end

    def recipe_by_id
        @recipe = Recipe.find(params[:id])
    end

private

    def recipe_params
        params.require(:recipe).permit(:name, :description)
    end
end