Rails.application.routes.draw do
  
  get '/'=>'homes#top'
  resources :parkings, only: [:index, :show]
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admins,skip: [:passwords], controllers: {
    registrations: "admins/registrations",
    sessions: 'admins/sessions'
  }
  # レンタル顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords] ,controllers: {
    registrations: "customers/registrations",
    sessions: 'customers/sessions'
  }
   # 提供顧客用
  # URL /customers/sign_in ...
  devise_for :providers, skip: [:passwords] ,controllers: {
    registrations: "providers/registrations",
    sessions: 'providers/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
