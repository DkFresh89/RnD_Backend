class GamesController < ApplicationController

    def index
        @games = Game.all
    end

    def gameover
        @game = params.permit!()
    end

end
