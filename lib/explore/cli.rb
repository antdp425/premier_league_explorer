#Handles input/output for user

class CLI
   def explore
      API.create_teams
      welcome
      menu
      input = ""
      input = gets.downcase.strip
      while input != "exit"
         if Team.all.any?{|t| t.name.downcase === input} &&
            (input == Team.find_team(input).name.downcase) && 
            Team.find_team(input).has_info?
               Team.find_team(input).display_info
         # elsif (input == Team.find_team(input).name.downcase) && !Team.find_team(input).has_info?
         #    Team.find_team(input).add_attributes
         else
            puts "Sorry, I don't understand."
         end
         puts "What would you like to do next?"
         input = gets.downcase.strip
      end
      puts "Bye"
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