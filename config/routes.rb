Rails.application.routes.draw do
  devise_for :users
  root 'item#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end
end
