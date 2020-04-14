#Handles input/output for user

class CLI
   def explore
      API.create_teams
      welcome
      menu
      input = gets.downcase.strip
      while input != "exit"
         if Team.has_team?(input) && Team.find_team(input).has_info?
            team = Team.find_team(input)
            display_info(team)
         elsif Team.has_team?(input) && !Team.find_team(input).has_info?
            team = Team.find_team(input)
            API.get_attributes(team)
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
      Team.print_teams
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