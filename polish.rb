
class RPNCalculator
    def evaluate
        expression = gets.split 				# splits input on breaks
        operands = []
        evaluation = []

        expression.each do |x|
            case x
                when /\d/ 							# When a digit, do this
                    evaluation.push(x.to_f)			# turns evaluation to float
                when "-", "/", "*", "+", "**"			# When it hits an operand, do this
                    operands = evaluation.pop(2)		# pop last two numbers off, assign them to operands
                    evaluation.push(operands[0].send(x, operands[1]))  # push new evaluation in to array
            end
        end
        puts evaluation
    end
end

oi = RPNCalculator.new
oi.evaluate


# get input, puts in to array
# when input is operand, pop last two and execute
# put out total
