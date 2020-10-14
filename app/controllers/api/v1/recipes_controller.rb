class Api::V1::RecipesController < ApiController
    before_action :set_recipe, only: [:show, :update]

    def index
        @recipes = Recipe.paginate(page: params[:page], per_page: 10)
    end

    def show
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            render json: @recipe.as_json, status: :ok
        end
        #debugger
    end

    def update
    end

    private
    
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        #data = request.body.read
        #params.permit(:name, :description, :chef_id)
        params.require(:recipe).permit(:name, :description, :chef_id, ingredient_ids: [])
    end
    
end