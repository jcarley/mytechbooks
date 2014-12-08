class CreatedBookEvent

  attr_accessor :data

  def initialize(params)
    @data = params
  end
end
