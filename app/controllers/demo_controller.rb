class DemoController < ApplicationController
  def welcome
    @counts = {
      posts: Post.count,
      authors: Author.count,
      reactions: Reaction.count
    }
  end

  def post_list
    Debugbar.msg("Entering controller method", {params: params.permit!.to_h})
    @posts = Post.order("RANDOM()").includes(:authors).first(16)
    @total = Rails.cache.fetch "nb_total_posts" do
      Post.count
    end

    @posts.first(3).each do |post|
      WarmupCacheJob.perform_later post.id
    end
  end

  def post
    ActionDispatch::Http::Headers
    @post = Post.includes(:authors, :reactions).find(params[:id])
  end

  def random_post
    @post = Post.order("RANDOM()").first
    redirect_to @post
  end

  def slow_page
    sleep 5
    @post = Post.last
    render "post"
  end

end
