evaluation = []
loop {
  input = gets.chomp.split 	                                
  symbols = []
  input.each do |a|
    case a
    when "-", "/", "*", "+"
      if evaluation.size > 1
        symbols = evaluation.pop(2)
        evaluation.push(symbols[0].send(a, symbols[1]))
      else  
        puts "Please enter more than one number first."
      end
    when /[0-9]/
      evaluation << a.to_f
    when "q", "quit", "exit"
      puts "Quitting"
      exit
    when /[a-zA-Z]/
      puts "Please enter a number or operation."
    end
  end
puts evaluation.last
}