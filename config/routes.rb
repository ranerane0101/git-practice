Rails.application.routes.draw do
  namespace "api" do
    resources :users, only: %i[create update]
    # アクションメソッドlogin
    post 'login', to: 'authentication#login'
  end
end
