class AddUidToBook < ActiveRecord::Migration
  def change
    add_column :books, :uid, :string
    add_index :books, :uid
  end
end
