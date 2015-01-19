evaluation = []
until evaluation.include?('q')
    input = gets.chomp.split 	                                
    symbols = []
    input.each do |a|
        case a
            when "-", "/", "*", "+"			                         # When it hits an operand, do this
                if evaluation.size > 1
                    symbols = evaluation.pop(2)		                 # pop second to last two numbers off (operation is in last place), assign them to symbols
                    evaluation.push(symbols[0].send(a, symbols[1]))  # Take two before last.  push number(symbols[0]), a(which is operation in this 'when'), 
                else                                                 # and number (symbols[1]).  Send will send [0] to operation and [1], push in to array.  
                    puts "Please enter more than one number first."
                end
            when /\d/                                            # When a digit, do this
                    evaluation << a.to_f                             # pushes input as float to evaluation array
            when "q", "quit", "exit"
                    puts "Quitting"
                    exit
            when /[a-zA-Z]/
                    puts "Please enter a number or operation."
        end
    end
    puts evaluation
end

# Methods for things like 'evaluation.include?('q')
# such as 'user_has_asked_to_quit'

# Drop the case
#       if is_operator?(a)
#     ...end
# if is_quit_command?(a)
#     ...end
#     if is_character?(a)
#     ...end

# You know, you could give them two answers
# compact and then readable
# That would let them know that you can see value in either style and have the ability to distinguish the difference