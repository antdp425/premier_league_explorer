#Creates team objects

class Team
   attr_accessor :name, :founded, :position, :wins, :draws, :losses, :g_scored, :g_conceded, :matches_played, :website, :goal_difference, :points

   @@all = []

   def initialize (team_hash)
      team_hash.each{|k,v| self.send("#{k}=",v)}
      save
   end

   def self.all
      @@all.sort_by!{|t| t.name}
   end

   def save
      @@all << self
   end

end