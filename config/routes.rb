Rails.application.routes.draw do
  get 'posts/new'
 
  resources :posts
  
  
end
