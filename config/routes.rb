Rails.application.routes.draw do

  post "comments/:post_id/user_create" => "comments#user_create"
  post "comments/:post_id/prouser_create" => "comments#prouser_create"

  # get 'users/show'
  # いいねのページ
  post "likes/:post_id/user_create" => "likes#user_create"
  post "likes/:post_id/prouser_create" => "likes#prouser_create"
  # いいね削除のページ
  post "likes/:post_id/user_destroy" => "likes#user_destroy"
  post "likes/:post_id/prouser_destroy" => "likes#prouser_destroy"
  
  # users===============
  get "users/login" => "users#login_form"
  post "users/login" => "users#login"
  post "users/logout" => "users#logout"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  get "users/signup" => "users#new"
  post "users/create" => "users#create"
  get "users/:id" => "users#show"
  # prousers===============

  # ログインフォームのページ
  get "prousers/login" => "prousers#login_form"
  # フォームのデータを受け取る
  post "prousers/login" => "prousers#login"
  post "prousers/logout" => "prousers#logout"
  # ユーザー一覧ページ
  get "prousers/index" => "prousers#index"
  # 新規登録ページ
  get "prousers/signup" => "prousers#new"
  post "prousers/create" => "prousers#create"
  # ユーザー詳細ページ
  get "prousers/:id" => "prousers#show"
  # ユーザー編集ページ
  get "prousers/:id/edit" => "prousers#edit"
  #編集したページのフォームデータを受け取るページ
  post "prousers/:id/update" => "prousers#update"
  
  get "prousers/:id/profile" => "prousers#profile"
  post "prousers/:id/update_profile" => "prousers#update_profile"


  get "prousers/:id/likes" => "prousers#likes"
  get "users/:id/likes" => "users#likes"


  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  get "/" => "home#top"

end
