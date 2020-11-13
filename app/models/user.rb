class User < ActiveRecord::Base

    has_many :decks
    has_many :cards, through: :decks
    
    validates :first_name, :email, :password, presence: true
    validates :email, uniqueness: { case_sensitive: false }
    has_secure_password
end
