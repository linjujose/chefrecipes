json.pagination do 
    json.current_page @recipes.current_page
    json.per_page @recipes.per_page
    json.total_entries @recipes.total_entries
end

json.recipes @recipes do | recipe | 
    json.recipe_id recipe.id
    json.title recipe.name
    json.description recipe.description[0..10] + "..."
end