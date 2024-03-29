class LiveController < ApplicationController
  include ActionController::Live

  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    10.times {
      response.stream.write "data: #{Time.now}\n\n"
      sleep 0.5
    }
  ensure
    response.stream.close
  end
end
