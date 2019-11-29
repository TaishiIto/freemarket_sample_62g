Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations' ,
    omniauth_callbacks: 'users/omniauth_callbacks'
    } #SNS認証
  root 'items#index'
  resources :items do
    collection do
      post 'upload_image'
    end
  end

  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resources :users,only: [:show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :signup, only: :create do
    collection do
      get 'step1'
      get 'step2'
      get 'step3' # ここで、入力の全てが終了する
      get 'save'
      get 'done' # 登録完了後のページ
    end
  end
end
