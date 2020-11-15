class CardsController < ApplicationController

  # GET: /cards
  get "/:deckslug/cards" do
    @deck = Deck.find_by_slug_and_user_id(params[:deckslug])
  end

  # GET: /cards/new
  get "/cards/new" do
    erb :"/cards/new.html"
  end

  # POST: /cards
  post "/cards" do
    redirect "/cards"
  end

  # GET: /cards/5
  get "/cards/:id" do
    erb :"/cards/show.html"
  end

  # GET: /cards/5/edit
  get "/cards/:id/edit" do
    erb :"/cards/edit.html"
  end

  # PATCH: /cards/5
  patch "/cards/:id" do
    redirect "/cards/:id"
  end

  # DELETE: /cards/5/delete
  delete "/cards/:id/delete" do
    redirect "/cards"
  end
end
