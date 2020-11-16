class NotesController < ApplicationController

  # POST: /notes
  post "/decks/:deckslug/cards/:cardslug/notes" do
    @deck = Deck.find_by_slug_and_user_id(params[:deckslug], @user.id)
    @card = Card.find_by_slug_and_deck_id(params[:cardslug], @deck.id)
    if @card
      @note = Note.new(content: params[:content], card_id: @card.id)
      if @note.save
        flash[:info] = "Note added."
        redirect "/decks/#{ @deck.slug }/cards/#{ @card.slug }"
      else
        redirect "/decks/#{ @deck.slug }/cards/#{ @card.slug }"
      end
    else
      flash[:error] = "Please navigate to a Deck or Card you own."
      redirect "/decks"
    end
  end

  # PATCH: /notes/5
  patch "/decks/:deckslug/cards/:cardslug/notes/:id" do
    @deck = Deck.find_by_slug_and_user_id(params[:deckslug], @user.id)
    @card = Card.find_by_slug_and_deck_id(params[:cardslug], @deck.id)
    @note = Note.find_by(card_id: @card.id, id: params[:id])
    if @note
      @note.update(content: params[:content])
      redirect "/decks/#{ @deck.slug }/cards/#{ @card.slug }"
    else
      flash[:error] = "Please navigate to a Deck or Card you own."
      redirect "/decks/#{ @deck.slug }/cards/#{ @card.slug }"
    end
  end

  # DELETE: /notes/5/delete
  delete "/decks/:deckslug/cards/:cardslug/notes/:id" do
    @deck = Deck.find_by_slug_and_user_id(params[:deckslug], @user.id)
    @card = Card.find_by_slug_and_deck_id(params[:cardslug], @deck.id)
    @note = Note.find_by(card_id: @card.id, id: params[:id])
    if @note
      flash[:info] = "Note successfully deleted."
      @note.destroy
      redirect "/decks/#{ @deck.slug }/cards/#{ @card.slug }"
    else
      flash[:error] = "Please navigate to a Deck or Card you own."
      redirect "/decks/#{ @deck.slug }/cards/#{ @card.slug }"
    end
  end
end
