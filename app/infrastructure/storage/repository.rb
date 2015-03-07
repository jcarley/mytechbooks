module Storage
  module Repository

    def initialize(db)
      @db = db
    end

    def save(record)
      record.save!
    end

    def delete_by(id)
      record = db.find_by(:id => id)
      self.delete(record)
    end

    def delete(record)
      record.destroy!
    end

    def load_all(&block)
      db.find_each.lazy.each(&bock)
    end

    private
    attr_reader :db

  end
end
