#Creates team objects

class Team
   attr_accessor :name, :founded, :position, :wins, :draws, :losses, :g_scored, :g_conceded, :website

   @@all = []

   def initialize (name:)
      @name = name
      save
   end

   def add_attributes(founded:, position:, wins:, draws:, losses:, g_scored:, g_conceded:, website:)
      @founded = founded
      @position = position
      @wins = wins
      @draws = draws
      @losses = losses
      @g_scored = g_scored
      @g_conceded = g_conceded
      @website = website
   end

   def self.find_team(team)
      all.detect {|t| t.name.downcase == team}
      # has_data = found.position != nil
      # found && has_data ?
   end

   def self.has_team?(team)
      self.all.any?{|t| t.name.downcase == team} 
   end

   def has_info?
      self.position
   end

   def display_info
      puts "This is the team you found and their info"
      puts self
   end

   # def self.add_attributes_to_team(team)
   #    found = all.detect {|t| t.name.downcase == team}
   # end

   def self.all
      @@all
   end

   def save
      @@all << self
   end

   def self.print_teams
      puts all.sort_by{|t| t.name}.collect{|t| t.name}
   end

end