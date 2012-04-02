class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :number
      t.string :name
      t.string :school
      t.references :ultimate_team
      t.integer :height
      t.integer :weight
      t.string :club_team

      t.timestamps
    end
    add_index :players, :ultimate_team_id
  end
end
