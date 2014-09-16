Rails.application.routes.draw do
  
  root to: 'visitors#home'

  devise_for :users, controllers: {sessions: 'sessions'}

  get '/home', to: 'visitors#home', as: 'home'
  get '/mysol', to: 'visitors#mysol', as: 'mysol'
  get '/destination', to: 'visitors#destination', as: 'destination'
  get '/solblog', to: 'visitors#solblog', as: 'solblog'
  get '/travel', to: 'visitors#travel', as: 'travel'

  resources :blogs
  resources :locations

  post '/photos/create', to: 'blogs#create_photo', as: 'photos'
  delete '/photos/:id', to: 'blogs#destroy_photo', as: 'photo'
  put '/destination/select_top', to: 'blogs#select_top', as: 'select_top'
  post '/support', to: 'visitors#support', as: 'support'
  post '/solblog', to: 'visitors#post_comment', as: 'post_comment'

  get '/solblog_feed', to: 'visitors#solblog_feed', as: 'solblog_feed', default: {:format => 'rss'}

end
