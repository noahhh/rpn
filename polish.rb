
class RPN

    def evaluate
        evaluation = []
        until evaluation.include?('q')
        expression = gets.split 				# splits input on breaks
        operands = []
        expression.each do |x|
            case x
                when /\d/ 							# When a digit, do this
                    evaluation.push(x.to_f)			# turns evaluation to float
                when "-", "/", "*", "+", "**"			# When it hits an operand, do this
                    operands = evaluation.pop(2)		# pop last two numbers off, assign them to operands
                    evaluation.push(operands[0].send(x, operands[1]))  # push new evaluation in to array
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
