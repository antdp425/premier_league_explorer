#Creates team objects

class Team
   attr_accessor :name, :founded, :position, :wins, :draws, :losses, :g_scored, :g_conceded, :matches_played, :website

   @@all = []

   def initialize (team_hash)
      team_hash.each{|k,v| self.send("#{k}=",v)}
      save
   end

   # def add_attributes(att_hash)
   #    att_hash.each{|k,v| self.send("#{k}=",v)}
   # end

   def self.find_team(team)
      all.detect {|t| t.name.downcase == team}
   end

   def self.has_team?(team)
      self.all.any?{|t| t.name.downcase == team} 
   end

   def has_info?
      self.position
   end

   def self.all
      @@all.sort_by!{|t| t.name}
   end

   def save
      @@all << self
   end

   # def self.print_teams
   #    all.sort_by{|t| t.name}.collect{|t| t.name}
   # end

end