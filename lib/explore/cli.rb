#Handles input/output for user

class CLI
   def explore
      puts ""
      puts "Welcome to Premier League Explorer!!!"
      puts ""
      puts "=============================="
      puts "      Current Standings       "
      puts "=============================="
      puts "[Table here]"
      puts ""
      puts "Type a team name for more information:"
      @input = gets.strip.downcase
   end
end