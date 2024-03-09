class Api::UsersController < ApplicationController
  before_action :authenticate, only: %i[update]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { user: { name: @user.name, email: @user.email } }
    else
      render json: { errors: { body: @user.errors } }, status: :unprocessable_entity
    end
  end

  # 認証がないと実行できないメソッド
  def update
    if @current_user.update(user_params)
      render json: { user: { name: @current_user.name, user_type: @current_user.user_type } }
    else
      render json: { user: { name: @current_user.name } }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :user_type)
  end

  
end
