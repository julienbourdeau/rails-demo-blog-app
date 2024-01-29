class WarmupCacheJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    # Do nothing
  end
end
