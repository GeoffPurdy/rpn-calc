class RpnCalc
   EOF = nil
   QUIT_SIGNALS = [EOF, 'q']
   OPERATORS    = ['+', '-', '*', '/']

   def initialize
      @stack = []
   end

   def push(text)
   end

   def pop()
   end

   def isNumeric?(text)
      return true if Float(text) rescue false
   end

   def isOperator(text)
   end

   def isQuit?(text)
      return QUIT_SIGNALS.include?(text)
   end

end
