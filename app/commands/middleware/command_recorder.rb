module Middleware
  class CommandRecorder

    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(env) if @app

      cmd = env[:command]
      elapsed = env.fetch(:elapsed, nil)
      if cmd
        CommandSource.create(:user_id => 1, class_type: cmd.class.name, body: cmd.to_json)
      end
    end

  end
end
