#Handles input/output for user

class CLI
   def explore
      API.create_teams
      welcome
      menu
      input = gets.downcase.strip
      while input != "exit"
         if input.to_i >= 1 && input.to_i <= Team.all.length
            display_info(Team.all[input.to_i - 1])
            prompt
         elsif input == "menu"
            menu
         else
            space
            puts "Sorry, I don't understand.".colorize(:color => :light_yellow, :mode => :bold)
            prompt
         end
         input = gets.downcase.strip
      end
      ejected
   end

   def welcome
      space
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts "Welcome to Premier League Explorer!!"
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      space
   end

   def menu
      space
      Team.all.each.with_index(1){|t,i| puts "[#{i}] -- #{t.name}"}
      space
      space
      puts "Select the [number] of a team from the list above to view team facts and stats:".colorize(:color => :light_cyan, :mode => :bold)
      space
   end

   def display_info(team)
      fact_rows = []
      fact_rows << ["Founded", "Official Site"]
      fact_rows << :separator
      fact_rows << [team.founded,team.website]

      fact_table = Terminal::Table.new :title => team.name, :rows => fact_rows
      2.times{|i| fact_table.align_column(i, :center)}


      stat_rows = []
      stat_rows << ["#Pos.","Club","P","W","D","L","GF","GA","GD","PTS".colorize(:mode => :bold)]
      stat_rows << :separator
      stat_rows << ["#{team.position}.", team.name, team.matches_played, team.wins,team.draws, team.losses, team.g_scored, team.g_conceded, team.g_scored - team.g_conceded, ((team.wins* 3)+(team.draws)).to_s.colorize(:mode => :bold)]


      current_standing_table = Terminal::Table.new :title => "Current Standings", :rows => stat_rows
      10.times{|i| current_standing_table.align_column(i, :center)}

      space
      puts fact_table
      space
      puts current_standing_table
      space

      key
   end

   def prompt
      space
      puts "Please enter the [number] of a team from the list above to view another team.".colorize(:color => :light_cyan, :mode => :bold)
      puts "You may also type 'menu' to view the list again or 'exit' to leave the application:".colorize(:color => :light_cyan, :mode => :bold)
      space
   end

   def ejected
      space
      puts "🔴🔴🔴 GET OFF THE FIELD 🔴🔴🔴"
      space 
   end

   def space
      puts ""
   end

   def key
      puts "Key:".colorize(:mode => :bold)
      puts " -" + "#Pos.:".colorize(:mode => :bold) + " Position"
      puts " -" + "P:".colorize(:mode => :bold) + " Played"
      puts " -" + "W:".colorize(:mode => :bold) + " Wins"
      puts " -" + "D:".colorize(:mode => :bold) + " Draws"
      puts " -" + "L:".colorize(:mode => :bold) + " Losses"
      puts " -" + "GF:".colorize(:mode => :bold) + " Goals For"
      puts " -" + "GA:".colorize(:mode => :bold) + " Goals Against"
      puts " -" + "GD:".colorize(:mode => :bold) + " Godl Difference"
   end

   # -- WIP --- 
   # def get_team_color
   #    "default".to_sym
# Arsenal - red / yellow
# Aston Villa - light blue / dark red
# Brighton & Hove Albion - blue / white 
# Burnley - light blue / purple
# Chelsea - blue / white
# Crystal Palace - red / blue
# Everton - blue / white
# Leicester City - white / bloe
# Liverpool - red / white
# Manchester City - white / light blue
# Manchester United - red / yellow
# Newcastle United - black / white
# Norwich City - green / yellow
# Sheffield United - black / red
# Southampton - red / white
# Tottenham Hotspur - navy/whye
# Watford - yellow / red
# West Ham United - dark red / light blue
# Wolverhampton Wanderers - orange / black


   # colors
   #      :black   => 0, :light_black    => 60,
   #      :red     => 1, :light_red      => 61,
   #      :green   => 2, :light_green    => 62,
   #      :yellow  => 3, :light_yellow   => 63,
   #      :blue    => 4, :light_blue     => 64,
   #      :magenta => 5, :light_magenta  => 65,
   #      :cyan    => 6, :light_cyan     => 66,
   #      :white   => 7, :light_white    => 67,
   #      :default => 9
   # modes
   #      :default   => 0, # Turn off all attributes
   #      :bold      => 1, # Set bold mode
   #      :italic    => 3, # Set italic mode
   #      :underline => 4, # Set underline mode
   #      :blink     => 5, # Set blink mode
   #      :swap      => 7, # Exchange foreground and background colors
   #      :hide      => 8  # Hide text (foreground color would be the same as background)
   # end

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