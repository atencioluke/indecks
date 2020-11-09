class Card < ActiveRecord::Base
    belongs_to :deck
    has_many :notes
    has_and_belongs_to_many :tags
end
