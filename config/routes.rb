Lilliputian::Application.routes.draw do
    root "posts#index"
    
    # Auth
    resources :sessions
    get "/login" => "sessions#new"
    get "/logout" => "sessions#destroy"

    # Posts
    resources :posts
end
