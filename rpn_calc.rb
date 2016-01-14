class RpnCalc
   EOF = nil
   QUIT_SIGNALS = [EOF, 'q']
   OPERATORS    = ['+', '-', '*', '/']

   def initialize
      @stack = []
   end

   def read
   end

   def write
   end

   def isNumeric?(text)
   end

   def isOperator(text)
   end

   def isQuit?(text)
      return QUIT_SIGNALS.include?(text)
   end

end
