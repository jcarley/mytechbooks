module Middlware
  class CommandRecorder

    def initialize(app)
      @app = app
    end

    def call(env)
      cmd = env[:command]
      if cmd
        CommandSource.create(:user_id => 1, class_type: cmd.class.name, body: cmd.to_json)
      end
      @app.call(env) if @app
    end

  end
end
