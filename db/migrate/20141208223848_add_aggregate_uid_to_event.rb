class AddAggregateUidToEvent < ActiveRecord::Migration
  def change
    add_column :events, :aggregate_uid, :string
    add_index :events, :aggregate_uid
  end
end
