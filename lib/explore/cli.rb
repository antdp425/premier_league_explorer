#Handles input/output for user

class CLI
   def explore
      API.create_teams
      welcome
      menu
      input = ""
      # while input != "exit"
      #    input = gets.downcase.strip
      # end
      # @input = gets.strip.downcase
      # API.get_team(@input)
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
      puts Team.print_teams
      puts ""
      puts ""
      puts "Select a team from the list above to view team facts and stats:"
      puts ""
   end
end