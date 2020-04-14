#Handles input/output for user

class CLI
   def explore
      API.create_teams
      welcome
      menu
      input = gets.strip
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
      Team.all.each.with_index(1){|t,i| puts "#{i}. #{t.name}"}
      puts ""
      puts ""
      puts "Select the number of a team from the list above to view team facts and stats:"
      puts ""
   end

   def display_info(team)
      puts ""
      puts "----------------------------------------"
      puts team.name.center(40)
      puts "----------------------------------------"
      puts "   Founded: #{team.founded}"
      puts "   Offical Site: #{team.website}"
      puts ""
      puts "----------------------------------------"
      puts "Current Position".center(40)
      puts "----------------------------------------"
      puts "  #Pos.  P W D L   GS GA GD".center(42)
      puts "- - - - - - - - - - - - - - - - - - - - "
      puts "#{team.position}. #{team.name}".center(5) +  "#{team.matches_played} #{team.wins} #{team.draws} #{team.losses}   #{team.g_scored} #{team.g_conceded} #{team.g_scored - team.g_conceded}".center(27)
      puts "----------------------------------------"
   end

   def prompt
      puts ""
      puts "Please enter the number of a team from the list above or type 'exit'."
      puts "You may also type 'menu' to view the list again:"
      puts ""
   end
end