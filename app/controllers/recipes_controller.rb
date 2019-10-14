class RecipesController < ApplicationController

  get "/category/:id/recipes" do
    @category_id = params[:id]
    erb :"/recipes/add_recipe"
  end

  post "/category/:id/recipes/add" do
    recipe = Recipe.new(params)
    recipe[:category_id] = params[:id]
    if recipe.save
      redirect "/categories/#{params[:id]}/recipes"
    else
      erb :"/categories/add_category"
    end
    redirect "/recipes"
  end
end
