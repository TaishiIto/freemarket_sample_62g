Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations' ,
    omniauth_callbacks: 'users/omniauth_callbacks'
    } #SNS認証
  root 'items#index'
  resources :items do
    member do
      get "purchase"
      post 'buy'
      get "done"
    end
  end
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      delete 'delete', to: 'cards#delete'
    end
  end
  resources :users,only: [:show, :destroy, :edit, :update] do
    member do
      get 'profile'
      patch 'profile_update'
    end
    collection do
      get 'ready'
    end
  end
  resources :signup, only: :create do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで、入力の全てが終了する
      get 'save'
      get 'done' # 登録完了後のページ
    end
  end
end
