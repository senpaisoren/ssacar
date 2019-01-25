Rails.application.routes.draw do
  resources :concerns
  devise_for :users
  resources :texts do
  	member do
  		put "like", to: "texts#upvote"
  		put "dislike", to: "texts#downvote"
  		put "unlike", to: "texts#unlike"
  		put "undislike", to: "texts#undislike"
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :suggestions do
    get '/suggestions' => 'suggestions#index'
  end
  root 'texts#index'
end
