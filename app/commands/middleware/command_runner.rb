module Middlware
  class CommandRunner

    def initialize(app)
      @app = app
    end

    def call(env)
      cmd = env[:command]
      cmd.execute if cmd
      @app.call(env) if @app
    end

  end
end
