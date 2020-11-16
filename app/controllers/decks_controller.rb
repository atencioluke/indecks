class DecksController < ApplicationController

  # GET: /decks
  get "/decks" do
    erb :"/decks/decks"
  end

  # GET: /decks/new
  get "/decks/new" do
    erb :"/decks/new"
  end

  # POST: /decks
  post "/decks" do
    @deck = Deck.new(name: params[:name], user_id: @user.id)
    if @deck.save
      redirect to "/decks/#{ @deck.slug }"
    else
      flash[:error] = "Please enter a valid name."
      redirect to '/decks/new'
    end
  end
  
  # GET: /decks/slug
  get "/decks/:slug" do
    @deck = Deck.find_by_slug_and_user_id(params[:slug], @user.id)
    if @deck
      @cards = Card.where(deck_id: @deck.id)
      erb :"/decks/show"
    else
      flash[:error] = "Please navigate to a Deck you own."
      redirect to "/decks"
    end
  end

  # GET: /decks/slug/edit
  get "/decks/:slug/edit" do
    @deck = Deck.find_by_slug_and_user_id(params[:slug], @user.id)
    if @deck
      erb :"/decks/edit"
    else
      flash[:error] = "Please navigate to a Deck you own."
      redirect "/decks"
    end
  end

  # PATCH: /decks/slug
  patch "/decks/:slug" do
    @deck = Deck.find_by_slug_and_user_id(params[:slug], @user.id)
    if @deck
      @deck.update(name: params[:name])
      redirect "/decks/#{ @deck.slug }"
    else
      flash[:error] = "Please navigate to a Deck you own."
      redirect "/decks"
    end
  end

  # DELETE: /decks/5/delete
  delete "/decks/:slug" do
    @deck = Deck.find_by_slug_and_user_id(params[:slug], @user.id)
    if @deck
      flash[:info] = "#{@deck.name} successfully deleted."
      @deck.destroy
      redirect "/decks"
    else
      flash[:error] = "Please navigate to a Deck you own."
      redirect "/decks"
    end
  end
end
