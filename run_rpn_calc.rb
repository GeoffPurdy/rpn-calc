require_relative 'rpn_calc.rb'

PROMPT = "> "
QUIT_SIGNAL = ['q', nil] # EOF is nil
ERROR_MSG = 'ERROR'

calc = RpnCalc.new()

print PROMPT 
while !QUIT_SIGNAL.include?(input = gets.chomp)
   begin
      calc.enter(input)
      puts calc.display
      print PROMPT
   rescue
      puts ERROR_MSG
      abort
   end
end

exit


