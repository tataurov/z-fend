class BlogController < ApplicationController
  def index
    @posts = Post.order('id').reverse
  end

  def post
    @post = Post.find(params[:id])
  end
end
