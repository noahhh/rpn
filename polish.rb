operands = []
loop do
  input = gets.chomp.split
  input.each do |token|
    case token
    when "-", "/", "*", "+"
      if operands.size > 1
        symbols = operands.pop(2)
        operands.push(symbols[0].send(token, symbols[1]))
      else  
        warn "Please enter more than one number first."
      end
    when /\d+(\.\d+)?/
      operands << token.to_f
    when "q", "quit", "exit"
      puts "Quitting"
      exit
    else
      warn "Please enter a number or operation."
    end
  end
  puts operands.last
end