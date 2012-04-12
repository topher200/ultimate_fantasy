class AddUserToOwner < ActiveRecord::Migration
  def change
    add_column :owners, :user, :references
  end
end
