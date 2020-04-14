#Handles input/output for user

class CLI
   def explore
      API.create_teams
      welcome
      menu
      binding.pry
      input = gets.downcase.strip
      while input != "exit"
         if input.to_i <= 1 && input >= Team.print_teams.length
            team = Team.print_teams[input.to_i]
            display_info(team)
         elsif input == "menu"
            menu
         else
            puts ""
            puts "Sorry, I don't understand."
         end
         puts ""
         puts "Please enter a team from the list above or type 'exit'."
         puts "You may also type 'menu' to view the list again:"
         puts ""
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
      Team.all.each{|t| puts t.name}
      puts ""
      puts ""
      puts "Select a team from the list above to view team facts and stats:"
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
end