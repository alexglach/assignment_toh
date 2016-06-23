#Introduce game 
puts "Welcome to Tower of Hanoi!"

#Ask for number of disks
number_of_disks = 0
while number_of_disks < 1 || number_of_disks > 100
  puts "How many disks would you like to play with? Enter a number from 1 to 100"
  print "> "
  number_of_disks = gets.chomp.to_i
end

puts "You're playing with #{number_of_disks} disks! Good luck.\n"

#set up towers
towers = [(1..(number_of_disks.to_i)).to_a.reverse, [], []]

#METHODS

#establish criteria for victory
def check_for_victory(towers, number_of_disks, victory)
  if towers[1].join == (1..(number_of_disks.to_i)).to_a.reverse.join || towers [2].join == (1..(number_of_disks.to_i)).to_a.reverse.join
    render(towers, number_of_disks)
    puts "You win! Thanks for playing"
    exit
  end
end

#execute user's move
def make_user_move(user_move_array, towers)
  towers[user_move_array[1]] << towers[user_move_array[0]].pop
end

#convert user's input to array
def make_user_move_array (user_move, user_move_array)
  user_move.split(",").each do |input|
    user_move_array << input.to_i - 1
  end
end

#check if user wants to quit
def check_user_quit(user_move)
  if user_move == "q" || user_move == "quit"
    puts "Thanks for playing! See you next time."
    exit
  end
end

#display current board
def render(towers, number_of_disks)
  puts "Current Board:"
  counter = number_of_disks - 1
  while counter >= 0
    tower_counter = 0
    while tower_counter < 3
      if towers[tower_counter][counter] != nil
        printing_amount = towers[tower_counter][counter].to_i
        print ("#" *  printing_amount) + " " * (number_of_disks -  printing_amount + 1)
      else
        print " " * (number_of_disks + 1)
      end
      tower_counter += 1
    end
    puts "\n"
    counter -=1
  end
  puts "1".ljust(number_of_disks + 1) + "2".ljust(number_of_disks + 1) + "3".ljust(number_of_disks + 1)
end


#play game!
def play_game(number_of_disks, towers)
  print "To move the top disk in one tower to the top of another tower, please enter your move in the format 1,3 with the first number being the tower to move from and the second number being the tower to move to. Enter 'q' to exit the game." + "\n"
  #While victory criteria is not met
  victory = false
  while victory == false
    render(towers, number_of_disks)
   
    #Get move and validate move for format and game rules
    errors = 1
    while errors > 0
    
      puts "Whats your next move?" 
      print "> "
      user_move = gets.chomp
      user_move_array = []
      make_user_move_array(user_move, user_move_array)
      check_user_quit(user_move)
      
      #error check for format and game rules
      possible_towers = (0..2).to_a
      until (possible_towers.include?(user_move_array[0].to_i) && possible_towers.include?(user_move_array[1].to_i)) && (towers[user_move_array[0]].empty? == false) && (towers[user_move_array[1]].empty? || towers[user_move_array[1]][-1].to_i > towers[user_move_array[0]][-1].to_i)
        puts "There was an error in your input. Remember to enter your input in X,X format. Please try again."
        #get new input
        puts "Whats your next move?" 
        print "> "
        user_move = gets.chomp
        user_move_array = []
        make_user_move_array(user_move, user_move_array)
        check_user_quit(user_move)
      end
      errors -= 1
      
    end
    make_user_move(user_move_array, towers)

    check_for_victory(towers, number_of_disks, victory)

  end
end

play_game(number_of_disks, towers)






