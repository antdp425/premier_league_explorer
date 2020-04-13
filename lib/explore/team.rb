#Creates team objects

class Team
   attr_accessor :name, :founded, :position, :wins, :draws, :losses, :g_scored, :g_conceded, :website

   @@all = []

   def initialize (name:)
      @name = name
      save
   end

   def self.all
      @@all
   end

   def save
      @@all << self
   end

   def self.print_teams
      all.sort_by{|t| t.name}.collect{|t| t.name}
   end
end