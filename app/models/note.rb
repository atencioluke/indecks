class Note < ActiveRecord::Base
    belongs_to :card
    validates :content, presence: true
end
