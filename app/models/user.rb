class User < ApplicationRecord
    has_many :games 
    has_many :game_questions, through: :game
end
