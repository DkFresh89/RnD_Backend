class User < ApplicationRecord
    has_many :games, dependent: :destroy
    has_many :game_questions, through: :game

    validates :username, uniqueness: { case_sensitive: false }

    def update_high_score
        last_game = self.games.last
        if self.high_score <= last_game.score
            last_game.score
        else
            self.high_score
        end
    end

    def self.order_by_high_score
        all.sort_by(&:high_score)
    end 

    def update_rank
        User.order_by_high_score.find_index(self) + 1
    end

end
