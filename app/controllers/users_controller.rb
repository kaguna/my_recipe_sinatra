class UsersController < ApplicationController

  get "/users/register" do
    erb :"/users/register"
  end

  post "/users/register" do
    user = User.new(params)
    if user.save
      redirect "/users/login"
    else
      erb :"/users/register"
    end
  end

  get "/users/login" do
    erb :"/users/login"
  end

  post "/users/login" do
    redirect "/home"
  end

  get "/home" do
    erb :"/home/index"
  end
end
