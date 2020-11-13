class Tag < ActiveRecord::Base
    include SlugMod::InstanceMethods
    extend SlugMod::ClassMethods

    has_and_belongs_to_many :cards
    belongs_to :deck

    validates :name, presence: true
end
