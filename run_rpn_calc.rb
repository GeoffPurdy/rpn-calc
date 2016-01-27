require_relative 'rpn_calc.rb'

PROMPT = '> '.freeze
QUIT_SIGNAL = "q\n".freeze
WELCOME_MSG = 'RPN Calculator - q or ctrl+d or EOF to exit'.freeze
ERROR_MSG = 'ERROR'.freeze

calc = RpnCalc.new

puts WELCOME_MSG
print PROMPT

STDIN.each_line do |input_line|
  exit if input_line.nil? || input_line.eql?(QUIT_SIGNAL)
  begin
    calc.enter(input_line.chomp)
    # use sprintf to clean up messy float arithmetic
    puts sprintf('%g', calc.display)
    print PROMPT
  rescue
    # calculator is in an invalid state
    # and further operations would yield erroneous results
    # example:  division by zero
    puts ERROR_MSG
    abort
  end
end
