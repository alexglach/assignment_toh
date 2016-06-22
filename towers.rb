#Introduce game and get number of disks



full_tower = [(1..number_of_disks.to_i).to_a]
towers = [full_tower, [], []]

def check_for_victory(towers, full_tower, victory)
  if towers[1].join == full_tower.join || towers [2].join == full_tower.join
    victory = true
  end
end


def validate_input_format(move, valid_input_format, instructions, number_of_disks)
  if move == "q" || move == "Q"
    puts "Thanks for playing. See you later!"
    exit
  end
  move_array = move.split(",")
  if move_array.length != 2
    puts "Please only include two inputs. Please try again."
    puts instructions
    return valid_input_format = false 
  end

  array_nums = []

  move_array.each do |move_entry|
    array_nums << move_array[move_entry].to_i
  end

  array_nums.each do |move_entry|
    puts move_entry.class
  end
  
  array_nums.each do |move_entry|
    if move_entry < 1 || move_entry >= number_of_disks
      puts "Some of your inputs were not numbers. Please try again."
      puts instructions
      return valid_input_format = false
    end
  end
  return valid_input_format = true
end

def validate_input_move(move, valid_input_move, instructions)
end


def play(number_of_disks, towers, full_tower)
  #Instructions
  instructions = "Enter where you'd like to move from and to in the format '1,3' (but with no quotes, dummy). This example would move the top ring from the first column to the third column. Enter 'q' to quit."
  puts "Instructions:"
  puts  instructions
  victory = false
  until victory == true
     #Check for victory
    check_for_victory(towers, full_tower, victory)
    #Display current board
    #Ask for move
    valid_input_format = false
    valid_input_move = true
    until valid_input_format == true && valid_input_move == true
      puts "What's your next move:"
      print "> "
      move = gets.chomp
      #Validate user input format
      validate_input_format(move, valid_input_format, instructions, number_of_disks)
      #Validate move within rules
      validate_input_move(move, valid_input_move, instructions)
    end
    #Make move
  end
  puts "You win!"




end

play(number_of_disks, towers, full_tower)