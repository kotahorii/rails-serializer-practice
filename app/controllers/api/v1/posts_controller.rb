class Api::V1::PostsController < ApplicationController
  before_action :set_post, except:[:index, :create]

  def index
    posts = Post.all
    render status: 200, json: { data: posts }
  end

  def create
    user = User.find(params[:user_id])
    post = user.posts.create(post_params)
    if post
      render status: 200, json: { data: post }
    else
      render status: 400, json: { data: post.errors }
    end
  end

  def show
    render status: 200, json: { data: @post }
  end

  def update
    if @post.update(post_params)
      render status: 200, json: { data: @post }
    else
      render status: 400, json: { data: @post.errors }
    end
  end

  def destroy
    @post.destroy
    render status: 200,json: { msg: '投稿を削除しました。' }
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:text, :user_id)
  end
end
