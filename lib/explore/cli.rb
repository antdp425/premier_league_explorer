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
         elsif input == "menu"
            menu
         else
            puts ""
            puts "Sorry, I don't understand."
         end
         prompt
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
      puts "Select the number of a team from the list above to view team facts and stats:"
      puts ""
   end

   def display_info(team)
      fact_rows = []
      fact_rows << [team.founded,team.website]
      fact_table = Terminal::Table.new :title => team.name, :headings => ["Founded".colorize(:blue), "Official Site"], :rows => fact_rows
      fact_table.align_column(0, :center)
      fact_table.align_column(1, :center)


      stat_rows = []
      stat_rows << ["#{team.position}.", team.name, team.matches_played, team.wins,team.draws, team.losses, team.g_scored, team.g_conceded, team.g_scored - team.g_conceded]

      current_standing_table = Terminal::Table.new :title => "Current Standings", :headings => ["#Pos.","Club","Played","Wins","Draws","Losses","GF","GA","GD"], :rows => stat_rows

      puts ""
      puts fact_table
      puts ""
      puts current_standing_table
      puts ""

   end

   def prompt
      puts ""
      puts "Please enter the number of a team from the list above or type 'exit'."
      puts "You may also type 'menu' to view the list again:"
      puts ""
   end
end