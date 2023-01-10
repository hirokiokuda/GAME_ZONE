Rails.application.routes.draw do
  #root to: "homes#top"
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'games_comments/show'
    get 'games_comments/edit'
    get 'games_comments/update'
  end
  namespace :admin do
    get 'games/index'
    get 'games/new'
    get 'games/create'
    get 'games/show'
    get 'games/edit'
    get 'games/update'
  end
  
  namespace :public do
    get 'group/new'
    get 'group/create'
    get 'group/index'
    get 'group/edit'
    get 'group/update'
    get 'group/destroy'
    get 'group/show'
  end
  namespace :public do
    get 'game_comments/index'
    get 'game_comments/update'
    get 'game_comments/create'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :public do
    get 'games/index'
    get 'games/show'
  end
  
  
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
