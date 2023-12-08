class DemoController < ApplicationController
  def post_list
    @posts = Post.includes(:authors).last(12)
  end

  def post
    @post = Post.includes(:authors, :reactions).find(params[:id])
  end

  def random_post
    @post = Post.order("RAND()").first
    redirect_to @post
  end

  def jobs
    @posts = Post.order("RAND()").first(12)
  end
end
