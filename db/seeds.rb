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

csv_files = Dir[Rails.root.join('lib', 'data', '*.csv')]
csv_files.each do |filename|
  team_name = File.basename((filename), ".csv")
  CSV.foreach(filename, :headers => :first_row, :col_sep => "|") do |player|
    p = Player.new(:name => player['name'],
                   :ultimate_team => find_team(team_name))
    player.headers.each do |header|
      p[header] = player[header] if player[header]
    end
    p.save
  end
end

Owner.create(:name => "Topher")
