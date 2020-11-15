class Deck < ActiveRecord::Base
    include SlugMod::InstanceMethods
    extend SlugMod::ClassMethods

    belongs_to :user
    has_many :cards
    has_many :tags, through: :cards

    validates :name, presence: true
    validates :name, uniqueness: { scope: :user_id }
end
