class CreateFantasyPlayers < ActiveRecord::Migration
  def change
    create_table :fantasy_players do |t|
      t.references :owner
      t.references :player
      t.integer :status
      t.integer :week

      t.timestamps
    end
    add_index :fantasy_players, :owner_id
    add_index :fantasy_players, :player_id
  end
end
