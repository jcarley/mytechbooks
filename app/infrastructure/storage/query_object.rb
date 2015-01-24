module Storage
  module QueryObject
    include Enumerable

    def initialize(repository)
      @repository = repository
    end

    def each(&block)
      repository.load_all(&block)
    end

    private
    attr_reader :repository
  end
end
