class Event < ActiveRecord::Base
  self.table_name = 'domain_events'

  serialize :data, JSON
end
