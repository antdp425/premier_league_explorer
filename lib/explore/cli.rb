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
         puts "Type 'MENU' to view the original list of teams again to view stats and facts.".colorize(:color => :light_cyan, :mode => :bold)
         puts "Type 'TABLE' to view current standings of the English Premier League.".colorize(:color => :light_cyan, :mode => :bold)
         puts "Type 'EXIT' at any time to leave the application.".colorize(:color => :light_cyan, :mode => :bold)
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
      stat_rows << [
         "#{team.position}.", 
         team.name, 
         team.matches_played, 
         team.wins,
         team.draws, 
         team.losses, 
         team.g_scored, 
         team.g_conceded, 
         team.goal_difference, 
         team.points.to_s.colorize(:mode => :bold)
      ]


      current_standing_table = Terminal::Table.new :title => "Current Standings", :rows => stat_rows
      10.times{|i| current_standing_table.align_column(i, :center)}

      space
      puts fact_table
      space
      puts current_standing_table
      space

      key
   end

   def display_table

      table_rows = []
      table_rows << ["#Pos.","Club","P","W","D","L","GF","GA","GD","PTS".colorize(:mode => :bold)]
      table_rows << :separator
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


      table = Terminal::Table.new :title => "Standings", :rows => table_rows
      10.times{|i| table.align_column(i, :center)}

      space
      puts table
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