class RenameEventToDomainEvents < ActiveRecord::Migration
  def change
    rename_table :events, :domain_events
  end
end
