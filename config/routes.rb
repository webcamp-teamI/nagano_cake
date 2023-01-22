Rails.application.routes.draw do
  # get 'items' => 'items#show'

  # 会員側のルーティング設定
  scope module: :public do
    get 'about' => "homes#about", as: "about"
    root to: "homes#top"
    resources :items, only: [:show, :index]
    resource :customers, only: [:edit, :update,]
    patch '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    get 'customers/confirm' => 'customers#confirm'
    get 'customers' => 'customers#show'
    resources :carts, only: [:index, :update, :destroy, :create]
    delete 'carts/destroy_all' => 'carts#destroy_all'
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/check' => 'orders#check'
    get 'orders/complete' => 'orders#complete'
    resources :deliveries, only: [:index, :edit, :create, :update, :destroy]
    
    
  end

  # 管理者側のルーティング設定
  namespace :admin do
    get '/' => "homes#top"
    resources :items, only: [:new, :create, :show, :index, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index,:edit, :update, :show]
    resources :orders, only: [:show, :update]
    resources :orders_details, only: [:update]
    # get 'items' => 'admin/items#index'
    # get 'items' => 'admin/items#show'
  end



  # namespace :public do
  #   get 'deliveries/index'
  #   get 'deliveries/edit'
  # end
  # namespace :public do
  #   get 'orders/new'
  #   get 'orders/check'
  #   get 'orders/complete'
  #   get 'orders/index'
  #   get 'orders/show'
  # end
  # namespace :public do
  #   get 'customers/show'
  #   get 'customers/edit'
  #   get 'customers/confirm'
  # end
  # namespace :public do
  #   get 'carts/index'
  # end
  # namespace :public do
  #   get 'homes/top'
  #   get 'homes/about'
  # end



  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
