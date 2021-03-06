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
    if @deck
      @card = Card.new(name: params[:name], tags: params[:tags], deck_id: @deck.id)
      if @card.save
        redirect to "/decks/#{ @deck.slug }/cards/#{ @card.slug }"
      else
        flash[:error] = "Please enter a valid name."
        redirect to "/decks/#{ @deck.slug }/"
      end
    else
      flash[:error] = "Please navigate to a Deck you own."
      redirect to "/decks"
    end
  end

  # GET: /decks/deckslug/cards/slug
  get "/decks/:deckslug/cards/:slug" do
    @deck = Deck.find_by_slug_and_user_id(params[:deckslug], @user.id)
    @card = Card.find_by_slug_and_deck_id(params[:slug], @deck.id)
    @tags = @card.tags.split(",").join(", ")
    @notes = Note.where(card_id: @card.id).order(updated_at: :desc)
    erb :"/cards/show"
  end

  # GET: /decks/deckslug/cards/slug/edit
  get "/decks/:deckslug/cards/:slug/edit" do
    @deck = Deck.find_by_slug_and_user_id(params[:deckslug], @user.id)
    @card = Card.find_by_slug_and_deck_id(params[:slug], @deck.id)
    @tags = @card.tags
    erb :"/cards/edit"
  end

  # PATCH: /decks/deckslug/cards/slug
  patch "/decks/:deckslug/cards/:slug" do
    @deck = Deck.find_by_slug_and_user_id(params[:deckslug], @user.id)
    @card = Card.find_by_slug_and_deck_id(params[:slug], @deck.id)
    if @card
      @card.update(name: params[:name])
      @card.update(tags: params[:tags])
      redirect "/decks/#{ @deck.slug }/cards/#{ @card.slug }"
    else
      flash[:error] = "Please navigate to a Deck or Card you own."
      redirect "/decks"
    end
  end

  # DELETE: /decks/deckslug/cards/slug
  delete "/decks/:deckslug/cards/:slug" do
    @deck = Deck.find_by_slug_and_user_id(params[:deckslug], @user.id)
    @card = Card.find_by_slug_and_deck_id(params[:slug], @deck.id)
    if @card
      flash[:info] = "#{@card.name} successfully deleted."
      @card.destroy
      redirect "/decks/#{ @deck.slug }"
    else
      flash[:error] = "Please navigate to a Deck or Card you own."
      redirect "/decks/#{ @deck.slug }"
    end
  end
end
