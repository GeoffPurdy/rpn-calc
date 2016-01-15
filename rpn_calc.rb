class RpnCalc
   EOF = nil
   ERROR_MSG = 'E' * 10 # like a handheld calculator
   QUIT_SIGNALS = [EOF, 'q']
   OPERATORS    = ['+', '-', '*', '/']

   def initialize
      @stack = []
   end

   def push(text)
      #if( isNumeric(text) )
      #   @stack.push
      #elsif( isOperator )
      #   validate
      #   operate
      #   push result
      #elsif(isQuit)
      #   quit
      #else
      #   input invalid - deal with it somehow
   end

   def pop()
      return @stack.pop()
   end

   def isNumeric?(text)
      return true if Float(text) rescue false
   end

   def isOperator(text)
      return OPERATORS.include?(text)
   end

   def isQuit?(text)
      return QUIT_SIGNALS.include?(text)
   end

end
