# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'


def find_team (team_string)
  UltimateTeam.all.each do |team|
    if team.name == team_string
      return team
    end
  end

  # We haven't found his team... we must need to make it!
  puts 'creating team ' + team_string
  return UltimateTeam.create(:name => team_string)
end

CSV.foreach(Rails.root.join('lib', 'data', 'players.csv'),
            :headers => :first_row, :col_sep => "|") do |player|
  Player.create(:name => player['name'], :number => player['number'],
                :school => player['school'],
                :ultimate_team => find_team(player['team']))
end
