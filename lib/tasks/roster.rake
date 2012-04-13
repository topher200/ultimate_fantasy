require 'rake'

namespace :roster do
  desc "clones all fantasy players, setting the clones' week"
  task :set, [:week] => :environment do |cmd, args|
    week = args[:week]
    FantasyPlayer.current_players.each do |fantasy_player|
      new_player = fantasy_player.dup
      new_player.week = week
      new_player.save
    end
  end
end

