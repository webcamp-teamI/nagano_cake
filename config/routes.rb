Rails.application.routes.draw do


  namespace :public do
    get 'deliveries/index'
    get 'deliveries/edit'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/check'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/confirm'
  end
  namespace :public do
    get 'carts/index'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
    get 'home/about' => "homes#about", as: "about"
    root to: "homes#top"

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
