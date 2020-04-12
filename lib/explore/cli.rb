#Handles input/output for user

class CLI
   def explore
      puts ""
      puts "Welcome to Premier League Explorer!!!"
      puts ""
      puts "=============================="
      puts "      Current Standings       "
      puts "=============================="
      puts ""
      API.get_table
      puts ""
      puts "Type a team name for more information:"
      @input = gets.strip.downcase
      API.get_team(@input)
   end
end