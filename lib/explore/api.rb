#Will talk / handle API
class API
   def self.get_table
      url = "https://api.footystats.org/league-tables?key=test85g57&season_id=2012"
      response = Net::HTTP.get(URI(url))
      table = JSON.parse(response)["data"]["league_table"]
      table.each {|t| puts "#{t["position"]}. #{t["cleanName"]}"}
   end
end