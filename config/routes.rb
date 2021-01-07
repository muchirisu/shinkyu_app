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
  
  
  

  
  
  # users===============
  # get "users/login" => "users#login_form"
  # post "users/login" => "users#login"
  # post "users/logout" => "users#logout"
  # post "users/:id/update" => "users#update"
  # get "users/:id/edit" => "users#edit"
  # get "users/signup" => "users#new"
  # post "users/create" => "users#create"
  # get "users/:id" => "users#show"


  # newusers==============
  # ログインフォームのページ
  
  
  
  
  
  
  
  #編集したページのフォームデータを受け取るページ
  
  # ユーザー編集ページ
  post "newusers/login" => "newusers#login"
  post "newusers/logout" => "newusers#logout"
  get "newusers/login" => "newusers#login_form"
  post "newusers/:id/update" => "newusers#update"
  get "newusers/:id/edit" => "newusers#edit"
  post "newusers/create" => "newusers#create"
  get "newusers/signup" => "newusers#new"
  get "newusers/index" => "newusers#index"
  get "newusers/:id" => "newusers#show"
  
  
  # get "newusers/:id/comments" => "newusers#comments"
  
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
  
# posts===============
  # get "posts/index" => "posts#index"
  # get "posts/new" => "posts#new"
  # get "posts/:id" => "posts#show"
  # post "posts/create" => "posts#create"
  # get "posts/:id/edit" => "posts#edit"
  # post "posts/:id/update" => "posts#update"
  # post "posts/:id/destroy" => "posts#destroy"
  get "/" => "home#top"

# newcomments
get "newcomments/index" => "newcomments#index"
# get "newcomments/new" => "newcomments#new"
post "newcomments/:post_id/create" => "newcomments#create"
# get "newcomments/:post_id/edit" => "newcomments#edit"
post "newcomments/:post_id/update" => "newcomments#update"
post "newcomments/:post_id/destroy" => "newcomments#destroy"


end
