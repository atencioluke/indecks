class DecksController < ApplicationController

  # GET: /decks
  get "/decks" do
    if logged_in?
      @user = current_user
      @decks = Deck.find_by(user: @user)
      erb :"/decks/decks"
    else
      redirect to "/signin"
    end
  end

  # GET: /decks/new
  get "/decks/new" do
    erb :"/decks/new.html"
  end

  # POST: /decks
  post "/decks" do
    redirect "/decks"
  end

  # GET: /decks/5
  get "/decks/:id" do
    erb :"/decks/show.html"
  end

  # GET: /decks/5/edit
  get "/decks/:id/edit" do
    erb :"/decks/edit.html"
  end

  # PATCH: /decks/5
  patch "/decks/:id" do
    redirect "/decks/:id"
  end

  # DELETE: /decks/5/delete
  delete "/decks/:id/delete" do
    redirect "/decks"
  end
end
