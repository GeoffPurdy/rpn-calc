class RpnCalc
   EOF = nil
   ERROR_MSG = 'E' * 10 # like a handheld calculator
   QUIT_SIGNALS = [EOF, 'q']
   OPERATOR_METHOD = Hash["+" => "+", "-" => "-", "*" => "*", "/" => "fdiv"]

   def initialize
      @stack = []
   end

   def enter(text)
      if( isNumeric?(text) )
         @stack.push(text)
      elsif( isOperator?(text) )
         operand1 = @stack.pop
         operand2 = @stack.pop 
         result = operand2.send(OPERATOR_METHOD[text], operand1)
         @stack.push(result)
      elsif(isQuit?(text))
         exit #FIXME: move this to UI 
      else
         abort 
      end
   end

   def exit_on_error()
      return ERROR_MSG
   end

   def display()
      return @stack.to_enum.peek()
   end

   def isNumeric?(text)
      return true if Float(text) rescue false
   end

   def isOperator?(text)
      return OPERATOR_METHOD.include?(text)
   end

   def isQuit?(text)
      return QUIT_SIGNALS.include?(text)
   end

end
