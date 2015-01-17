class RPN
    def evaluate
        evaluation = []
        until evaluation.include?('q')
        # puts '> '
        input = gets.chomp.split 	                                 # splits input on breaks
        symbols = []
        input.each do |a|
            case a
            when "-", "/", "*", "+"			                         # When it hits an operand, do this
                if evaluation.size > 1
                    symbols = evaluation.pop(2)		                 # pop last two numbers off (operand is in last place), assign them to symbols
                    evaluation.push(symbols[0].send(a, symbols[1]))  # Take two before last.  push number(symbols[0]), a(which is operand in this 'when'), 
                else                                                 # and number (symbols[1]).  Send will send [0] to operand and [1], push in to array.  
                    puts "you can't do that."
                end
                when /\d/                                            # When a digit, do this
                    evaluation.push(a.to_f)                          # pushes input as float to evaluation array
                when "q"
                    puts "Quitting"
                    exit
                end
            end
            puts evaluation.last
        end
    end
end

calc = RPN.new
calc.evaluate

# Need to make it so if symbol is added but isn't last, doesn't allow



# DONE?
# Need to bank the symbols if put in before two numbers/tell them they can't do that

# breaks when more symbols than numbers are in there