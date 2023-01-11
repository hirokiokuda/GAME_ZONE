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

  scope module: :public do
    resources :groups
    resources :games_comments, only: [:index, :update, :create] do
      resource :favorites, only: [:create, :destroy]
    end
    resources :customers, only: [:show, :edit, :update] do
      get :favorites, on: :collection
    end
    resources :games, only: [:index, :show]
  end

  namespace :admin do
    get "/" => "homes#top"
    resources :customers, except: [:new, :create, :destroy]
    resources :games, except: [:destroy]
    resources :games_comments, only: [:show, :edit, :update, :index]

  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
