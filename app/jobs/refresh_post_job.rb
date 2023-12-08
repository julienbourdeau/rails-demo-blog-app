class RefreshPostJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    Rails.cache.write("post:#{post_id}", Post.find(post_id).to_json)
  end
end
