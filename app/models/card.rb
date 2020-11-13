class Card < ActiveRecord::Base
    include SlugMod::InstanceMethods
    extend SlugMod::ClassMethods

    belongs_to :deck
    has_many :notes
    has_and_belongs_to_many :tags
    validates :name, presence: true
end
