class Api::V1::UsersController < ApplicationController
  before_action :set_user, except:[:index, :create]

  def index
    users = User.all
    render status: 200, json: { data: users }
  end

  def create
    user = User.new(user_params)
    if user.save
      render status: 200, json: { data: user }
    else
      render status: 400, json: { data: user.errors }
    end
  end

  def show
    render status: 200, json: { data: @user }
  end

  def update
    if @user.update(user_params)
      render status: 200, json: { data: @user }
    else
      render status: 400, json: { data: @user.errors }
    end
  end

  def destroy
    @user.destroy
    render status: 200,json: { msg: 'ユーザーを削除しました。' }
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name)
  end
end
