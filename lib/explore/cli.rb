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
            puts ""
            puts "Sorry, I don't understand.".colorize(:color => :light_yellow, :mode => :bold)
            prompt
         end
         input = gets.downcase.strip
      end
      puts ""
      puts "🔴🔴🔴 GET OFF THE FIELD 🔴🔴🔴"
      puts ""  
   end

   def welcome
      puts ""
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts "Welcome to Premier League Explorer!!"
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts ""
   end

   def menu
      puts ""
      Team.all.each.with_index(1){|t,i| puts "[#{i}] -- #{t.name}"}
      puts ""
      puts ""
      puts "Select the [number] of a team from the list above to view team facts and stats:".colorize(:color => :light_cyan, :mode => :bold)
      puts ""
   end

   def display_info(team)
      fact_rows = []
      fact_rows << ["Founded", "Official Site"]
      fact_rows << :separator
      fact_rows << [team.founded,team.website]

      fact_table = Terminal::Table.new :title => team.name, :rows => fact_rows
      2.times{|i| fact_table.align_column(i, :center)}


      stat_rows = []
      stat_rows << ["#Pos.","Club","P","W","D","L","GF","GA","GD"]
      stat_rows << :separator
      stat_rows << ["#{team.position}.", team.name, team.matches_played, team.wins,team.draws, team.losses, team.g_scored, team.g_conceded, team.g_scored - team.g_conceded]

      current_standing_table = Terminal::Table.new :title => "Current Standings", :rows => stat_rows
      9.times{|i| current_standing_table.align_column(i, :center)}

      puts ""
      puts fact_table
      puts ""
      puts current_standing_table
      puts ""

      key
   end

   def prompt
      puts ""
      puts "Please enter the [number] of a team from the list above to view another team.".colorize(:color => :light_cyan, :mode => :bold)
      puts "You may also type 'menu' to view the list again or 'exit' to leave the application:".colorize(:color => :light_cyan, :mode => :bold)
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

   # def get_team_color
   #    "default".to_sym
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

end