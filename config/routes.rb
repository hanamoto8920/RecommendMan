Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :public do
    resources :shops do 
      resources :comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit]
    get "/complete", :to => "users#complete"
    root :to => "homes#top"
    get "/about", :to => "homes#about"
  end
end
