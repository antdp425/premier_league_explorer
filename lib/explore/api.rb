#Will talk / handle API
class API

   def self.create_teams
      url = "https://api.footystats.org/league-teams?key=test85g57&season_id=2012&include=stats"
      response = Net::HTTP.get(URI(url))
      data = JSON.parse(response)["data"]
      data.each{|d| Team.new({
            name: d["cleanName"],
            founded: d["founded"], 
            position: d["table_position"], 
            wins: d["stats"]["seasonWinsNum_overall"], 
            draws: d["stats"]["seasonDrawsNum_overall"], 
            losses: d["stats"]["seasonLossesNum_overall"], 
            matches_played: d["stats"]["seasonMatchesPlayed_overall"],
            g_scored:d["stats"]["seasonScoredNum_overall"], 
            g_conceded: d["stats"]["seasonConceded_overall"], 
            website: d["official_sites"][""],
            goal_difference:d["stats"]["seasonScoredNum_overall"] - d["stats"]["seasonConceded_overall"],
            points: ((d["stats"]["seasonWinsNum_overall"] * 3) + (d["stats"]["seasonDrawsNum_overall"])) })
         }
   end

end