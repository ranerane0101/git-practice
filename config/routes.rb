Rails.application.routes.draw do
  namespace "api" do
    resources :users, only: %i[create update]
    # アクションメソッドlogin
    # conflict文章A 
    post 'login', to: 'authentication#login'
  end
end
