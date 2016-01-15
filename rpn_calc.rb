class RpnCalc
   EOF = nil
   ERROR_MSG = 'E' * 10 # like a handheld calculator
   QUIT_SIGNALS = [EOF, 'q']
   OPERATORS    = ['+', '-', '*', '/']

   def initialize
      @stack = []
   end

   def enter(text)
      if( isNumeric?(text) )
         @stack.push(text)
         puts(@stack.to_s)
      elsif( isOperator?(text) )
         puts(@stack.to_s)
         operand1 = @stack.pop
         operand2 = @stack.pop 
         result = operand1.send(text, operand2)
         @stack.push(result)
         puts(@stack.to_s)
      elsif(isQuit?(text))
         exit #FIXME: move this to UI 
      else
         abort 
      end
   end

   def display()
      return @stack.to_enum.peek()
   end

   def isNumeric?(text)
      puts( "isNumeric?(" + text + ")" )
      return true if Float(text) rescue false
   end

   def isOperator?(text)
      return OPERATORS.include?(text)
   end

   def isQuit?(text)
      return QUIT_SIGNALS.include?(text)
   end

end
