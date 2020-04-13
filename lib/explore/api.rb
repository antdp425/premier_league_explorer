#Will talk / handle API
class API

   def self.create_teams
      url = "https://api.footystats.org/league-teams?key=test85g57&season_id=2012&include=stats"
      response = Net::HTTP.get(URI(url))
      data = JSON.parse(response)["data"]
      teams = data.each{|t| team = Team.new(name: t["cleanName"])}
   end


#    def self.get_table
#       url = "https://api.footystats.org/league-tables?key=test85g57&season_id=2012"
#       response = Net::HTTP.get(URI(url))
#       table = JSON.parse(response)["data"]["league_table"]
# puts "=============================="
# puts "      Current Standings       "
# puts "=============================="
#          puts "Position    Club      Points"
#          puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#       table.each do |t|
#          puts "    #{t["position"]}. |      #{t["cleanName"]}  --  #{t["points"]} pts"
#          puts "----------------------------------------------"
#       end
#    end

#    def self.get_team(input)
#       url = "https://api.footystats.org/league-teams?key=test85g57&season_id=2012&include=stats"
#       response = Net::HTTP.get(URI(url))
#       teams = JSON.parse(response)["data"]
#       team = teams.detect{|t| t["cleanName"] == input.capitalize}
#       binding.pry
#    end
end