Rails.application.routes.draw do
  post "prousers/create" => "prousers#create"
  get "prousers/signup" => "prousers#new"
  get "prousers/index" => "prousers#index"
  get "prousers/:id" => "prousers#show"
  

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  get "/" => "home#top"
end
