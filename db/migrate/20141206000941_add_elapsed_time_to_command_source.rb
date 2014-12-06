class AddElapsedTimeToCommandSource < ActiveRecord::Migration
  def change
    add_column :command_sources, :elapsed, :float
  end
end
