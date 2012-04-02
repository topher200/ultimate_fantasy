class FantasyPlayer < ActiveRecord::Base
  belongs_to :owner
  belongs_to :player
  has_many :stats, :through => :player
end
