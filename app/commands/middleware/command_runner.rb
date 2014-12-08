module Middleware
  class CommandRunner

    class MissingCommandError < StandardError; end;
    class CommandInvalidError < StandardError; end;

    def initialize(app)
      @app = app
    end

    def call(env)
      cmd = env[:command]

      result = CommandResult.new(cmd).tap do |cr|
        begin
          throw MissingCommandError if cmd.nil?
          throw CommandInvalidError unless cmd.valid?
          cmd.execute
        rescue StandardError => e
          cr.error = e
        end
      end

      env[:command_result] = result

      @app.call(env) if @app
    end

  end
end
