class CardsController < ApplicationController

  # GET: /cards/new
  get "/decks/:deckslug/cards/new" do
    @deck = Deck.find_by_slug_and_user_id(params[:deckslug], @user.id)
    if @deck
      erb :"/cards/new"
    else
      redirect to "/decks"
    end
  end

  # POST: /cards
  post "/decks/:deckslug/cards" do
    @deck = Deck.find_by_slug_and_user_id(params[:deckslug], @user.id)
    redirect "/cards"
  end

  # GET: /cards/5
  get "/decks/:deckslug/cards/:slug" do
    @deck = Deck.find_by_slug_and_user_id(params[:deckslug], @user.id)
    erb :"/cards/show.html"
  end

  # GET: /cards/5/edit
  get "/decks/:deckslug/cards/:slug/edit" do
    @deck = Deck.find_by_slug_and_user_id(params[:deckslug], @user.id)
    erb :"/cards/edit.html"
  end

  # PATCH: /cards/5
  patch "/decks/:deckslug/cards/:slug" do
    @deck = Deck.find_by_slug_and_user_id(params[:deckslug], @user.id)
    redirect "/cards/:id"
  end

  # DELETE: /cards/5/delete
  delete "/decks/:deckslug/cards/:slug/delete" do
    @deck = Deck.find_by_slug_and_user_id(params[:deckslug], @user.id)
    redirect "/cards"
  end
end
