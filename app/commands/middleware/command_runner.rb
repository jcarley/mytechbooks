module Middleware
  class CommandRunner

    class MissingCommandError < StandardError; end;

    def initialize(app)
      @app = app
    end

    def call(env)
      cmd = env[:command]

      result = CommandResult.new(cmd).tap do |cr|
        begin
          throw MissingCommandError if cr.command.nil?
          cr.command.run
        rescue StandardError => e
          cr.error = e
        end
      end

      env[:command_result] = result

      @app.call(env) if @app
    end

  end
end
