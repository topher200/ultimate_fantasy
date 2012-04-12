# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv_files = Dir[Rails.root.join('lib', 'data', '*.csv')]
csv_files.each do |filename|
  team_name = File.basename((filename), ".csv")
  CSV.foreach(filename, :headers => :first_row, :col_sep => "|") do |player|
    p = Player.find_or_create_by_name(:name => player['name'], :ultimate_team =>
                                      UltimateTeam.find_or_create_by_name(:name =>
                                                                          team_name))
    player.headers.each do |header|
      p[header] = player[header] if player[header]
    end
    p.save
  end
end

admin = User.find_or_create_by_email(:email => "admin@admin.com",
                                     :password => "adminpassword")
user.toggle!(:admin)
Owner.find_or_create_by_name(:name => "Admin", :user_id => admin)

user = User.find_or_create_by_email(:email => "user@user.com",
                                    :password => "userpassword")
Owner.find_or_create_by_name(:name => "User", :user_id => user)
