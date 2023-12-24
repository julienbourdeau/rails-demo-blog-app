class ApplicationController < ActionController::Base
  before_action do
    Rails.cache.fetch "yolo_cache" do
      {testing_cache: true}
    end

    Debugbar.msg("before_action", {yolo: true, callee: __callee__})
  end

  after_action do
    Debugbar.msg("after_action debug", "xxx", params.permit!.to_h)
  end
end
