class GamesController < ApplicationController

    # def index
    #     @games = Game.all

    #     render json: @games
    # end

    def gameover
        @game = params.permit!()
        # byebug
        

        

        # Game.create(@game)

        render json: @game
    end

end
