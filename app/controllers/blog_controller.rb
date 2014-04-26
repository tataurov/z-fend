# coding: utf-8

class BlogController < ApplicationController
  def index
    @posts = Post.order('id').reverse
  end

  def post
    @post = Post.find(params[:id])
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to blog_url
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to blog_url, notice: 'Пост успешно создана' }
        format.json { render action: 'index', status: :created, location: @post }
      else
        format.html { render action: 'post_new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def post_new
    @post = Post.new
  end

  def post_params
    params.require(:post).permit(:post_title, :post_body)
  end
end
