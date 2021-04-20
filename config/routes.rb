Rails.application.routes.draw do
  # resources :game_questions
  resources :games
  # resources :users
  resources :questions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/questions/choose_game', to: 'questions#choosegame'
  post '/games/game_over', to: 'games#gameover'
end
