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
                    symbols = evaluation.pop(2)		             # pop last two numbers off, assign them to operands
                    evaluation.push(symbols[0].send(a, symbols[1]))  # push new evaluation in to array
                else
                    evaluation << input
                end
                when /\d/                                            # When a digit, do this
                    evaluation.push(a.to_f)                          # turns evaluation to float
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



# Need to bank the symbols if put in before two numbers
# breaks when more symbols than numbers are in there