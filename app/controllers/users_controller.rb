class UsersController < ApplicationController

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
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect to '/decks'
    else
      redirect to '/signup'
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

  get "/signout" do
    session.clear
    flash[:info] = "You have logged out."
    redirect to "/"
  end
end
