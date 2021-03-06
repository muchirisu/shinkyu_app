Rails.application.routes.draw do
  
  

  # get 'users/show'
  # いいねのページ
  # post "likes/:post_id/user_create" => "likes#user_create"
  # post "likes/:post_id/prouser_create" => "likes#prouser_create"
  # いいね削除のページ
  # post "likes/:post_id/user_destroy" => "likes#user_destroy"
  # post "likes/:post_id/prouser_destroy" => "likes#prouser_destroy"
  post "newlikes/:post_id/create" => "newlikes#create"
  post "newlikes/:post_id/destroy" => "newlikes#destroy"



  
  # ユーザー編集ページ

  get "newusers/login" => "newusers#login_form"
  post "newusers/login" => "newusers#login"
  post "newusers/logout" => "newusers#logout"
  post "newusers/:id/update" => "newusers#update"
  get "newusers/:id/edit" => "newusers#edit"
  post "newusers/create" => "newusers#create"
  get "newusers/signup" => "newusers#new"
  get "newusers/index" => "newusers#index"
  get "newusers/:id" => "newusers#show"
  get "newusers/:id/profile" => "newusers#profile"
  get "newusers/:id/likes" => "newusers#likes"

  
  
  
  
  
  
  # prousers===============
  # ログインフォームのページ
  # get "prousers/login" => "prousers#login_form"
  # フォームのデータを受け取る
  # post "prousers/login" => "prousers#login"
  # post "prousers/logout" => "prousers#logout"
  # ユーザー一覧ページ
  # get "prousers/index" => "prousers#index"
  # 新規登録ページ
  # get "prousers/signup" => "prousers#new"
  # post "prousers/create" => "prousers#create"
  # ユーザー詳細ページ
  # get "prousers/:id" => "prousers#show"
  # ユーザー編集ページ
  # get "prousers/:id/edit" => "prousers#edit"
  #編集したページのフォームデータを受け取るページ
  # post "prousers/:id/update" => "prousers#update"
  
  # get "prousers/:id/profile" => "prousers#profile"
  # post "prousers/:id/update_profile" => "prousers#update_profile"

  # newlikes===============
  # get "prousers/:id/likes" => "prousers#likes"
  # get "users/:id/likes" => "users#likes"
  
  
  

# newposts===============
  get "newposts/index" => "newposts#index"
  get "newposts/new" => "newposts#new"
  get "newposts/:id" => "newposts#show"
  post "newposts/create" => "newposts#create"
  get "newposts/:id/edit" => "newposts#edit"
  post "newposts/:id/update" => "newposts#update"
  post "newposts/:id/destroy" => "newposts#destroy"
  

  get "/" => "home#top"

# newcomments
get "newcomments/index" => "newcomments#index"
# get "newcomments/new" => "newcomments#new"
post "newcomments/:post_id/create" => "newcomments#create"
# get "newcomments/:post_id/edit" => "newcomments#edit"
post "newcomments/:post_id/update" => "newcomments#update"
post "newcomments/:post_id/destroy" => "newcomments#destroy"


resources :newusers do
  resource :relationships, only: [:create, :destroy]
  #memberとつけることでidを含むpathになる
  get :following, on: :member 
  get :follower, on: :member 
end

end
