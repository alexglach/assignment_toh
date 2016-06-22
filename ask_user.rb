def tower_of_hanoi(number)
    first_stack = (1 .. number).to_a
    second_stack = []
    third_stack = []
    moves = 0
    while third_stack != (1 .. number).to_a
        puts "First stack: #{first_stack}"
        puts "Second stack: #{second_stack}"
        puts "Third stack: #{third_stack}"
        
        puts ""
        puts "Moves = #{moves}"
        puts "What stack do you want to take from? first_stack, second_stack, or third_stack?"
        stack = gets.chomp
        while stack != "first_stack" && stack != "second_stack" && stack != "third_stack"
            puts "Please enter first_stack, second_stack, or third_stack"
            stack = gets.chomp
        end
        if first_stack[0] != nil && second_stack[0] != nil && third_stack[0] != nil    
            wrong_choice = 1
            while wrong_choice == 1
                if stack == "first_stack" && first_stack[0] > second_stack[0] && first_stack[0] > third_stack[0]
                    puts "The top disc on the stack you chose is bigger than the top discs on the other two stacks. Please choose again"
                    stack = gets.chomp
                        while stack != "first_stack" && stack != "second_stack" && stack != "third_stack"
                            puts "Please enter first_stack, second_stack, or third_stack"
                            stack = gets.chomp
                        end
                elsif stack == "second_stack" && second_stack[0] > first_stack[0] && second_stack[0] > third_stack[0]
                    puts "The top disc on the stack you chose is bigger than the top discs on the other two stacks. Please choose again"
                    stack = gets.chomp
                        while stack != "first_stack" && stack != "second_stack" && stack != "third_stack"
                            puts "Please enter first_stack, second_stack, or third_stack"
                            stack = gets.chomp
                        end
                elsif stack == "third_stack" && third_stack[0] > first_stack[0] && third_stack[0] > second_stack[0]
                    puts "The top disc on the stack you chose is bigger than the top discs on the other two stacks. Please choose again"
                    stack = gets.chomp
                        while stack != "first_stack" && stack != "second_stack" && stack != "third_stack"
                            puts "Please enter first_stack, second_stack, or third_stack"
                            stack = gets.chomp
                        end
                else
                    wrong_choice -= 1
                end
            end
        end
        errors = 1
        mover = nil
        while errors == 1
            if stack == "first_stack" && first_stack != []
                mover = first_stack.shift
                errors -= 1
            elsif stack == "second_stack" && second_stack != []
                mover = second_stack.shift
                errors -= 1
            elsif stack == "third_stack" && third_stack != []
                mover = third_stack.shift
                errors -= 1
            else
                puts "That stack is empty. Please choose another stack"
                stack = gets.chomp
            end
        end
        
        puts "What stack do you want to move to? first_stack, second_stack, or third_stack?"
        new_stack = gets.chomp
        while new_stack != "first_stack" && new_stack != "second_stack" && new_stack != "third_stack"
            puts "Please enter first_stack, second_stack, or third_stack"
            new_stack = gets.chomp
        end
        errors = 1
        while errors == 1
            if new_stack == "first_stack"
                if first_stack == [] || mover < first_stack[0]
                    first_stack.unshift(mover)
                    errors -= 1
                else
                    puts "The disc you're trying to move is bigger than the top disc in #{new_stack}. Please move to a different disc."
                    new_stack = gets.chomp
                end
            elsif new_stack == "second_stack" 
                if second_stack == [] || mover < second_stack[0]
                    second_stack.unshift(mover)
                    errors -= 1
                else
                    puts "The disc you're trying to move is bigger than the top disc in #{new_stack}. Please move to a different disc."
                    new_stack = gets.chomp
                end
            elsif new_stack == "third_stack"
                if third_stack == [] || mover < third_stack[0]
                    third_stack.unshift(mover)
                    errors -= 1
                else
                    puts "The disc you're trying to move is bigger than the top disc in #{new_stack}. Please move to a different disc."
                    new_stack = gets.chomp
                end
            else
                puts "Please enter first_stack, second_stack, or third_stack"
                new_stack = gets.chomp
            end
        
        end
        moves += 1
        puts ""
        puts ""
        puts ""
    end
    puts "You win! It took you #{moves} moves"
end

tower_of_hanoi(3)