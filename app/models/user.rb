class User < ApplicationRecord
    has_many :games 
    has_many :game_questions, through: :game
    has_secure_password
end
