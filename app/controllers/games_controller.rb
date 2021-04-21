class GamesController < ApplicationController

    def index
        @games = Game.all

        render json: @games
    end

    def gameover
        @game = params.permit!()

        new_game = {
            score: @game["score"],
            game_type: @game["game_type"],
            time: @game["time"],
            num_of_questions: @game["num_of_questions"],
            user_id: 1
            
        }

        Game.create(new_game)

        render json: new_game
    end

end
