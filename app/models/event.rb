class Event < ActiveRecord::Base

  serialize :data, JSON
end
