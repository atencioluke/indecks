class Deck < ActiveRecord::Base
    belongs_to :user
    has_many :cards
    has_many :tags, through: :cards
    has_many :notes, through: :cards 
end