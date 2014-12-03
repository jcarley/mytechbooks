class CreateCommandSources < ActiveRecord::Migration
  def change
    create_table :command_sources do |t|
      t.integer :user_id
      t.string :class_type, limit: 125
      t.text :body

      t.timestamps
    end
    add_index :command_sources, :user_id
    add_index :command_sources, :class_type
  end
end
