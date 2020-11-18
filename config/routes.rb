Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => {
    :registrations => "users/registrations",
    :sessions => "users/sessions"
  }

  scope module: :public do
    resources :shops do
      resources :comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit]
    get "/complete", :to => "users#complete"
    root :to => "homes#top"
    get "/about", :to => "homes#about"
    resources :genres
    resources :places, only: [:create, :index]
  end
end
