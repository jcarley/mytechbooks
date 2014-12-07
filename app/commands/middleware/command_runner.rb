module Middleware
  class CommandRunner

    class MissingCommandError < StandardError; end;
    class CommandInvalidError < StandardError; end;

    def initialize(app)
      @app = app
    end

    def call(env)
      cmd = env[:command]
      env[:command_result] = CommandResult.new(cmd)

      throw MissingCommandError if cmd.nil?
      throw CommandInvalidError unless cmd.valid?

      cmd.execute

      @app.call(env) if @app
    rescue StandardError => e
      env[:command_result].error = e
    end

  end
end
