#Creates team objects

class Team
   attr_accessor :name, :founded, :position, :wins, :draws, :losses, :g_scored, :g_conceded, :matches_played, :website, :goal_difference, :points

   @@all = []

   def initialize (team_hash)
      team_hash.each{|k,v| self.send("#{k}=",v)}
      save
   end

   def win_percent
      (self.wins.to_f / self.matches_played.to_f * 100).to_i
   end

   def self.all
      @@all.sort_by{|t| t.name}
   end

   def self.sort_by_wins
      @@all.sort{|a,b| b.wins <=> a.wins}
   end

   def save
      @@all << self
   end

end