class CommentsController < ApplicationController
    def create
        @recipe = Recipe.find(params[:recipe_id])
    end
end