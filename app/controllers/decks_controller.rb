class DecksController < ApplicationController

  # GET: /decks
  get "/decks" do
    if logged_in?
      @decks = Deck.find_by(user: @user)
      if @decks.nil?
        redirect to "/decks/new"
      else
        erb :"/decks/decks"
      end
    else
      redirect to "/signin"
    end
  end

  # GET: /decks/new
  get "/decks/new" do
    erb :"/decks/new"
  end

  # POST: /decks
  post "/decks" do
    if params[:name] == "" || !Deck.find_by(name: params[:name])
      redirect to '/decks/new'
    else
      @deck = Deck.create(name: params[:name], user_id: current_user.id)
      redirect to '/cards'
    end
    redirect "/decks"
  end

  # GET: /decks/5
  get "/decks/:id" do
    erb :"/decks/show"
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
