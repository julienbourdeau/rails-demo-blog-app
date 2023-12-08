class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(post_id, config = {})
    @post = Post.find(post_id)
    @recent_posts = Post.order(published_at: :desc).limit(5).to_a
    # Send email here
  end
end
