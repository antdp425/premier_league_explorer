#Handles input/output for user

class CLI

   def explore
      API.create_teams
      welcome
      menu
      prompt
      input = gets.downcase.strip
      while input != "exit"
         if input.to_i >= 1 && input.to_i <= Team.all.length
            display_info(Team.all[input.to_i - 1])
            space
            menu_prompt
         elsif input == "menu"
            menu
            menu_prompt
         elsif input == "table"
            display_table
            space
            table_prompt
         else
            space
            puts "Sorry, I don't understand.".colorize(:color => :light_yellow, :mode => :bold)
            menu_prompt
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
   end

   def prompt
      puts "Select the [NUMBER] of a team from the list above to view team facts and stats.".colorize(:color => :light_cyan, :mode => :bold)
      puts "Type 'TABLE' to view current standings of the English Premier League.".colorize(:color => :light_cyan, :mode => :bold)
      puts "Type 'EXIT' at any time to leave the application.".colorize(:color => :light_cyan, :mode => :bold)
      space
   end

   def menu_prompt
      puts "Select the [NUMBER] of a team from the list above to view team facts and stats.".colorize(:color => :light_cyan, :mode => :bold)
      puts "Type 'MENU' to view the original list of teams again.".colorize(:color => :light_cyan, :mode => :bold)
      puts "Type 'TABLE' to view current standings of the English Premier League.".colorize(:color => :light_cyan, :mode => :bold)
      puts "Type 'EXIT' at any time to leave the application.".colorize(:color => :light_cyan, :mode => :bold)
      space
   end

   def table_prompt
      puts "Type 'MENU' to view the original list of teams again.".colorize(:color => :light_cyan, :mode => :bold)
      puts "Type 'TABLE' to view current standings of the English Premier League.".colorize(:color => :light_cyan, :mode => :bold)
      puts "Type 'EXIT' at any time to leave the application.".colorize(:color => :light_cyan, :mode => :bold)
      space
   end

   def display_info(team)
      
      team_above = Team.all.find{|t| t.position == team.position - 1}
      team_below = Team.all.find{|t| t.position == team.position + 1}
      
      fact_rows = []
      fact_rows << ["Founded", "Official Site"]
      fact_rows << :separator
      fact_rows << [team.founded,team.website]
      
      fact_table = Terminal::Table.new :title => team.name, :rows => fact_rows
      2.times{|i| fact_table.align_column(i, :center)}
      
      
      stat_rows = []
      stat_rows << ["#Pos.","Club","P","W","D","L","GF","GA","GD","PTS"].collect{|s| s.colorize(:mode => :bold)}
      stat_rows << :separator

      if team_above != nil
         stat_rows << [
            "#{team_above.position}.", 
            team_above.name, 
            team_above.matches_played, 
            team_above.wins,
            team_above.draws, 
            team_above.losses, 
            team_above.g_scored, 
            team_above.g_conceded, 
            team_above.goal_difference, 
            team_above.points.to_s.colorize(:mode => :bold)
         ]
      end

      stat_rows << [
         "#{team.position}.", 
         team.name, 
         team.matches_played.to_s, 
         team.wins.to_s,
         team.draws.to_s, 
         team.losses.to_s, 
         team.g_scored.to_s, 
         team.g_conceded.to_s, 
         team.goal_difference.to_s, 
         team.points.to_s
      ].collect{|t| t.colorize(:color => :light_yellow, :mode => :bold)}

      if team_below != nil
         stat_rows << [
            "#{team_below.position}.", 
            team_below.name, 
            team_below.matches_played, 
            team_below.wins,
            team_below.draws, 
            team_below.losses, 
            team_below.g_scored, 
            team_below.g_conceded, 
            team_below.goal_difference, 
            team_below.points.to_s.colorize(:mode => :bold)
         ]
      end
      
      
      
      current_position_table = Terminal::Table.new :title => "Current Position", :rows => stat_rows
      10.times{|i| current_position_table.align_column(i, :center)}
      
      space
      puts fact_table
      space
      puts current_position_table
      space

      key
   end

   def display_table
      table_rows = []
      table_rows << ["#Pos.","Club","P","W","D","L","GF","GA","GD","PTS"].collect{|s| s.colorize(:mode => :bold)}
      Team.all.sort_by{|t| t.position}.each do |t|
         table_rows << :separator
         table_rows << [
            "#{t.position}.", 
            t.name, 
            t.matches_played, 
            t.wins,
            t.draws, 
            t.losses, 
            t.g_scored, 
            t.g_conceded, 
            t.goal_difference, 
            t.points.to_s.colorize(:mode => :bold)
         ]
      end


      standings = Terminal::Table.new :title => "Standings", :rows => table_rows
      10.times{|i| standings.align_column(i, :center)}

      space
      puts standings
      space

      key
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
      puts " -" + "GD:".colorize(:mode => :bold) + " Goal Difference +/-"
      puts " -" + "PTS:".colorize(:mode => :bold) + " Points"
   end
   
end