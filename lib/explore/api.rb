#Will talk / handle API
class API

   def self.create_teams
      url = "https://api.footystats.org/league-teams?key=test85g57&season_id=2012&include=stats"
      response = Net::HTTP.get(URI(url))
      data = JSON.parse(response)["data"]
      teams = data.each{|t| team = Team.new(name: t["cleanName"])}
   end

   def self.get_attributes(team_obj)
      team = team_obj
      name = team.name
      url = "https://api.footystats.org/league-teams?key=test85g57&season_id=2012&include=stats"
      response = Net::HTTP.get(URI(url))
      data = JSON.parse(response)["data"]
      data = data.detect{|t| t["cleanName"] == name}
      stats = data["stats"]
      team.add_attributes(
         founded: data["founded"], 
         position: data["table_position"], 
         wins: stats["seasonWinsNum_overall"], 
         draws: stats["seasonDrawsNum_overall"], 
         losses: stats["seasonLossesNum_overall"], 
         g_scored:stats["seasonScoredNum_overall"], 
         g_conceded: stats["seasonConceded_overall"], 
         website: data["official_sites"][""])
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
end