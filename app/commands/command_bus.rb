class CommandBus

  attr_reader :cache

  def initialize
    @cache = {}
    build_cache
  end

  def execute(command, *args)
    cmd_klass = lookup(command)
    cmd = cmd_klass.new(*args)
    default_middleware.call(:command => cmd)
    cmd
  end

  def lookup(command_key)
    self.cache[command_key]
  end

  def default_middleware
    @stack ||= Middleware::Builder.new do
      use Middlware::CommandRecorder
      use Middlware::CommandRunner
    end
    @stack
  end

  private

  def build_cache
    Command.descendants.each do |klass|
      @cache[to_command_key(klass)] = klass
    end
  end

  def to_command_key(klass)
    klass.name.demodulize.underscore.remove("_command").to_sym
  end

end
