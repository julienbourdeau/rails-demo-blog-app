class ApplicationController < ActionController::Base
  before_action do
    Debugbar.msg("before_action", {params: params.permit!.to_h})
  end
end
