class AddUserToOwner < ActiveRecord::Migration
  def change
    add_column :owners, :user_id, :integer
    add_index :owners, :user_id
  end
end
