class Domain
  include Singleton

  def self.execute(command)
    instance.execute(command)
  end

  def execute(command)
    default_middleware.call(:command => command)
    command
  end

  def default_middleware
    @stack ||= Middleware::Builder.new do
      use Middleware::CommandRecorder
      use Middleware::Benchmarker
      use Middleware::CommandRunner
    end
    @stack
  end

end
