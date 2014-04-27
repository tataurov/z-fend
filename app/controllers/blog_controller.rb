# coding: utf-8

class BlogController < ApplicationController
  def index
    @posts = Post.order('id').reverse
  end

  def show
    @post = Post.find(params[:id])
    render 'post'
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

  def new
    @post = Post.new
    render 'post_new'
  end

  def edit
    @post = Post.find(params[:id])
    render 'post_edit'
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to blog_url
    else
      render 'edit'
    end
  end

  def post_params
    params.require(:post).permit(:post_title, :post_body)
  end
end
