class DemoController < ApplicationController
  def post_list
    @post = Post.includes(:authors).last(10)
  end
end
