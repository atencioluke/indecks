class Card < ActiveRecord::Base
    include SlugMod::InstanceMethods
    extend SlugMod::ClassMethods

    belongs_to :deck
    has_many :notes
    validates :name, presence: true
    validates :name, uniqueness: { scope: :deck_id }
end
