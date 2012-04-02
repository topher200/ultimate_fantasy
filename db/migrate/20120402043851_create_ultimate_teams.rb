class CreateUltimateTeams < ActiveRecord::Migration
  def change
    create_table :ultimate_teams do |t|
      t.string :name

      t.timestamps
    end
  end
end
