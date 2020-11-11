class UsersController < ApplicationController

  # GET: /users
  # get "/users" do
  #   erb :"/users/index.html"
  # end

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
      @user = User.create(first_name: params[:first_name], email: params[:email], password: params[:password])
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
  post "/signin" do
    @user = User.find_by(:email => params[:email])
   
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/decks"
    else
      redirect "/signin"
    end
  end
end
