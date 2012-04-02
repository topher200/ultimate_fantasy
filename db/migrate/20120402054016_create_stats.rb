class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.references :player
      t.references :game
      t.integer :goals
      t.integer :assists
      t.integer :ds
      t.integer :turns

      t.timestamps
    end
    add_index :stats, :player_id
    add_index :stats, :game_id
  end
end
