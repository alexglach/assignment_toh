#Introduce game 
puts "Welcome to Tower of Hanoi!"

#Ask for number of disks
number_of_disks = 0
while number_of_disks < 1 || number_of_disks > 100
  puts "How many disks would you like to play with? Enter a number from 1 to 100"
  print "> "
  number_of_disks = gets.chomp.to_i
end

#set up towers
towers = [(1..(number_of_disks.to_i)).to_a.reverse, [], []]


#establish criteria for victory
def check_for_victory(towers, number_of_disks, victory)
  if towers[1].join == (1..(number_of_disks.to_i)).to_a.reverse.join || towers [2].join == (1..(number_of_disks.to_i)).to_a.reverse.join
    puts "Current Board:"
    print "Tower 1: " + towers[0].to_s
    print "Tower 2: " + towers[1].to_s
    print "Tower 3: " + towers[2].to_s
    puts "You win! Thanks for playing"
    exit
  end
end

def make_user_move(user_move_array, towers)
  towers[user_move_array[1]] << towers[user_move_array[0]].pop
end

def make_user_move_array (user_move, user_move_array)
  user_move.split(",").each do |input|
    user_move_array << input.to_i - 1
  end
end

#check if user wants to quit
def check_user_quit(user_move)
  if user_move == "q" || user_move == "Q"
    puts "Thanks for playing! See you next time"
    exit
  end
end

#Validate user move for format
def user_move_format(user_move_array, user_move_valid)
  #if there are more or less than two inputs, invalid input
  if user_move_array.length != 2
    return user_move_valid = false
  #if either input is an integer, invalid input
  end
end
  

def user_move_rules(user_move_array, towers)
  #if moving disk is larger than top disk on receiving tower, invalid input
  #if moving disk is from tower that does not exist, invalid input
  #if receiving tower does not exist, invalid input
end

def play_game(number_of_disks, towers)
  victory = false
  print "To move the top disk in one tower to the top of another tower, please enter your move in the format 1,3 with the first number being the tower to move from and the second number being the tower to move to." + "\n"
  #While victory criteria is not met
  while victory == false
    
   
    #Display current board
    #begin
    puts "Current Board:"
    print "Tower 1: " + towers[0].to_s
    print "Tower 2: " + towers[1].to_s
    print "Tower 3: " + towers[2].to_s + "\n"
   
    
    #Ask for user's next move
    puts "Whats your next move?" 
    print "> "
    user_move = gets.chomp
    user_move_array = []
    #make user input readable
    make_user_move_array(user_move, user_move_array)
    
    #check if user wants to quit?
    check_user_quit(user_move)
    
    #Validate move for game rules
    errors = 1
    until errors == 0
      if towers[user_move_array[0]][-1] < towers[user_move_array[1]][-1] 
        errors -= 1
      else
        puts "The disk you're trying to move is larger than the top disk on the tower you're trying to move to. Please try again"
        user_move = gets.chomp
        user_move_array = []
        #make user input readable
        make_user_move_array(user_move, user_move_array)
      end
    end
    
    #Make User Move
    make_user_move(user_move_array, towers)
    
    #error for all moves
    #rescue
      #puts "You made an error in your input! Please try again"
      #retry
    #end
    

    
    #Check for victory
    check_for_victory(towers, number_of_disks, victory)

  end
end

play_game(number_of_disks, towers)






