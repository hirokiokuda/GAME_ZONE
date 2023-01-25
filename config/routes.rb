Rails.application.routes.draw do
   # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  root to: "public/homes#top"
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  get "search" => "searches#search"

  scope module: :public do
    resources :customers, only: [:index, :show, :edit, :update] do
      get :favorites, on: :collection
    end
    resources :games, only: [:index, :show] do
      resources :game_comments, only: [:create, :destroy, :show] do
        resource :favorites, only: [:create, :destroy]
      end
    end
    resources :groups do
      get "join" => "groups#join"
      get "leave" => "groups#leave"
    end
  end

  namespace :admin do
    resources :customers, except: [:new, :create, :destroy]
    resources :games, except: [:destroy]
    resources :games_comments, only: [:show, :edit, :update, :index, :destroy]

  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
