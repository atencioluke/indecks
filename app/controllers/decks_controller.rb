class DecksController < ApplicationController

  # GET: /decks
  get "/decks" do
    @decks = Deck.where(user_id: current_user.id)
    erb :"/decks/decks"
  end

  # GET: /decks/new
  get "/decks/new" do
    erb :"/decks/new"
  end

  # POST: /decks
  post "/decks" do
    @deck = Deck.new(name: params[:name], user_id: current_user.id)
    if @deck.save
      redirect to "/decks/#{ @deck.slug }"
    else
      flash[:error] = "Please enter a valid name."
      redirect to '/decks/new'
    end
  end
  
  # GET: /decks/slug
  get "/decks/:slug" do
    @deck = Deck.find_by_slug(params[:slug])
    if @deck && @deck.user_id == current_user.id
      @cards = Card.find_by(deck_id: @deck.id)
      erb :"/decks/show"
    else
      flash[:error] = "Please navigate to a Deck you own."
      redirect to "/decks"
    end
  end

  # GET: /decks/5/edit
  get "/decks/:slug/edit" do
    @deck = Deck.find_by_slug(params[:slug])
    if @deck && @deck.user_id == current_user.id
      @cards = Card.find_by(deck_id: @deck.id)
      erb :"/decks/show"
    else
      flash[:error] = "Please navigate to a Deck you own."
      redirect "/decks"
    end
  end

  # PATCH: /decks/5
  patch "/decks/:slug" do
    @deck = Deck.find_by_slug(params[:slug])
    if @deck && @deck.user_id == current_user.id
      @cards = Card.find_by(deck_id: @deck.id)
      redirect "/decks/#{params[:slug]}"
    else
      flash[:error] = "Please navigate to a Deck you own."
      redirect "/decks"
    end
  end

  # DELETE: /decks/5/delete
  delete "/decks/:slug/delete" do
    @deck = Deck.find_by_slug(params[:slug])
    if @deck && @deck.user_id == current_user.id
      flash[:info] = "#{@deck.name} successfully deleted."
      @deck.delete
      redirect "/decks"
    else
      flash[:error] = "Please navigate to a Deck you own."
      redirect "/decks"
    end
  end
end
