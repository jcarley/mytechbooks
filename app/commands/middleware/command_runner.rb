module Middleware
  class CommandRunner

    def initialize(app)
      @app = app
    end

    def call(env)
      cmd = env[:command]
      cmd.execute if cmd && cmd.valid?
      @app.call(env) if @app
    end

  end
end
