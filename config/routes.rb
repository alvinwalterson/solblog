Rails.application.routes.draw do
  root to: 'visitors#home'
  devise_for :users


  resources :visitors do
  	collection do
  		get 'solblog'
  		get 'home'
  	end
  end
  resources :blogs

end
