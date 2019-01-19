Rails.application.routes.draw do
  devise_for :users
  resources :texts do
  	member do
  		put "like", to: "texts#upvote"
  		put "dislike", to: "texts#downvote"
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'texts#index'
end
