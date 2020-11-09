class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /signup
  get "/signup" do
    if !logged_in?
      erb :'users/signup'
    else
      redirect to '/decks'
    end
  end

  # POST: /signup
  post "/signup" do
    if params[:first_name] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/decks'
    end
  end

  # GET: /signin
  get "/signin" do
    if !logged_in?
      erb :'users/signin'
    else
      redirect to '/decks'
    end
  end

  # POST: /signin
  post "/login" do
    user = User.find_by(:email => params[:email])
   
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/decks"
    else
      redirect "/login"
    end
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
