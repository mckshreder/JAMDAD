Rails.application.routes.draw do

    
    root "posts#index"
    get "/users" => "users#index", as: :users
    get "/users/new" => "users#new", as: :new_user
    post "/users" => "users#create", as: :create_user
    get "/users/:id" => "users#show", as: :user_profile
    get "users/:id/edit" => "users#edit", as: :edit_users
    patch "users/:id" =>"users#update", as: :update_user
	delete "users/:id" => "users#destroy"

    get "/sessions/new" => "sessions#new", as: :new_session
    post "/sessions" => "sessions#create", as: :create_session
    get "/sessions/destroy" => "sessions#destroy", as: :destroy_session

    get "/posts" => "posts#index", as: :posts
    get "/posts/new" => "posts#new", as: :new_post
    post "/posts" => "posts#create", as: :create_post
    get "/posts/:id" => "posts#show", as: :post
    get "/posts/:id/edit" => "posts#edit", as: :edit_post
    put "/posts/:id" => "posts#update"
    patch "/posts/:id" => "posts#update"
    delete "posts/:id" => "posts#destroy"

    post "/posts/:id/comments" => "comments#create", as: :create_comment
    delete "comments/:id" => "comments#destroy", as: :delete_comment

    

  	
end
