class CommandSource < ActiveRecord::Base

  validates :user_id, :presence => true
  validates :body, :presence => true
  validates :class_type, :presence => true

end
