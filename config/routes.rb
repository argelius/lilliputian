Lilliputian::Application.routes.draw do
    root "posts#index"

    get "/about" => "pages#about"

    # Auth
    resources :sessions
    get "/login" => "sessions#new"
    get "/logout" => "sessions#destroy"

    # Posts
    resources :posts

    # Post archive
    get "/archive" => "posts#archive"
    get "/archive/:year" => "posts#archive"
    get "/archive/:year/:month" => "posts#archive"

    # Tags
    resources :tags
    resources :post_tags
end
