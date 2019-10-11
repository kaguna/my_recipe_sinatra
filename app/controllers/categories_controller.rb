class CategoriesController < ApplicationController

  # GET: /categories
  get "/categories" do
    erb :"/categories/index.html"
  end

  # GET: /categories/add
  get "/categories/add" do
    erb :"/categories/add_category"
  end

  # POST: /categories
  post "/categories" do
    category = Category.new(params)
    category[:user_id] = session[:user_id]
    if category.save
      redirect "/home"
    else
      erb :"/categories/add_category"
    end
  end

  # GET: /categories/5/edit
  get "/categories/:id/edit" do
    erb :"/categories/edit.html"
  end

  # PATCH: /categories/5
  put "/categories/:id" do
    redirect "/categories/:id"
  end

  # DELETE: /categories/5/delete
  delete "/categories/:id/delete" do
    category.destroy
    redirect "/home"
  end

  def category
    @category = Category.find(params[:id])
    p @category
  end
end
