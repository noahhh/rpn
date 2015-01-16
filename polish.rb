class RPN
    def evaluate
        evaluation = []
        until evaluation.include?('q')
        input = gets.split 				                             # splits input on breaks
        symbols = []
        input.each do |a|
            case a
                when "-", "/", "*", "+"			                     # When it hits an operand, do this
                if evaluation.size > 1
                    symbols = evaluation.pop(2)		             # pop last two numbers off (operand is in last place), assign them to symbols
                    evaluation.push(symbols[0].send(a, symbols[1]))  # push
                else
                    puts "you can't do that."
                end
                when /\d/                                            # When a digit, do this
                    evaluation.push(a.to_f)                          # pushes input as float to evaluation array
                when "q"
                    puts "Quitting"
                    exit
                end
            end
            puts evaluation
        end
    end
end

calc = RPN.new
calc.evaluate


# DONE?
# Need to bank the symbols if put in before two numbers/tell them they can't do that

# breaks when more symbols than numbers are in there