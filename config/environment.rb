ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require 'securerandom'
require 'pry'
require 'sinatra/flash'

SESSION_SECRET = 'fe11963bac27bb60085ee1a5ac5b1a25'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/controllers/application_controller'
require_relative '../app/models/slugmod.rb'
require_all 'app'