class RequestMetrics
  def initialize(app)
    @app = app
  end

  def call(env)
    DevTools::Acc.init(env['action_dispatch.request_id'])
    @app.call(env)
  end
end
