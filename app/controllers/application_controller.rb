require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, SESSION_SECRET
    register Sinatra::Flash
  end

  before do
    @user = current_user
    @decks = Deck.all.where(user_id: @user.id) if @user

    if request.path != "/" && request.path != "/signup" && request.path != "/signin"
        redirect "/signin" if !logged_in?
    end
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

  end

end
