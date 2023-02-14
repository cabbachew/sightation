Rails.application.routes.draw do
  root 'dashboard#index'

  post '/query' => 'dashboard#query', as: :query
end
