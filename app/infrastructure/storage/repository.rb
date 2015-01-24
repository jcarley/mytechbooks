module Storage
  module Repository

    def initialize(db)
      @db = db
    end

    def save(record)
      record.save!
    end

    def load_all(&block)
      db.find_each.lazy.each(&bock)
    end

    private
    attr_reader :db

  end
end
