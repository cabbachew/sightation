Rails.application.routes.draw do
  root 'dashboard#index'

  get '/query' => 'dashboard#query', as: :query
end
