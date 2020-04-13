#Handles input/output for user

class CLI
   def explore
      API.create_teams
      welcome
      menu
      input = gets.downcase.strip
      while input != "exit"
         if Team.has_team?(input) && Team.find_team(input).has_info?
            Team.find_team(input).display_info
         elsif Team.has_team?(input) && !Team.find_team(input).has_info?
            team = Team.find_team(input)
            API.get_attributes(team)
            team.display_info
         else
            puts ""
            puts "Sorry, I don't understand."
         end
         puts ""
         puts "Please enter a team from the list above or type 'exit':"
         puts ""
         input = gets.downcase.strip
      end
      puts ""
      puts "🔴🔴🔴 GET OFF THE FIELD 🔴🔴🔴"
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
end