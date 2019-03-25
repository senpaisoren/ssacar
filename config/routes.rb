Rails.application.routes.draw do
  resources :resolutions
  devise_for :users
  resources :texts do
  	member do
  		put "like", to: "texts#upvote"
  		put "dislike", to: "texts#downvote"
  		put "unlike", to: "texts#unlike"
  		put "undislike", to: "texts#undislike"
      put "report", to: "texts#report"
      put "unreport", to: "texts#unreport"
      put "resolve", to: "texts#resolve"
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :suggestions do
    get '/suggestions' => 'suggestions#index'
  end
  resources :recommendations do
    get '/recommendations' => 'recommendations#index'
  end
  resources :concerns do
    get '/concerns' => 'concerns#index'
  end
  resources :reports do
    get '/reports' => 'reports#index'
  end

  root 'texts#index'
end
