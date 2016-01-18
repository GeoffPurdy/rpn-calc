class RpnCalc
   OPERATOR_METHOD = Hash["+" => "+", "-" => "-", "*" => "*", "/" => "fdiv"]

   def initialize
      @stack = []
   end

   def display()
      begin
         display_text = @stack.to_enum.peek()
      rescue StopIteration
         display_text = 0 # show zero when clear
      end
      return display_text
   end

   def enter(input)
      if( isNumeric?(input) )
         save(input)
      elsif( isOperator?(input) )
         calculate(input)
      else
         raise ArgumentError, "Input is neither a valid operator nor a decimal number", caller 
      end
   end

   def calculate(operator)
      operand1, operand2 = @stack.pop(2)
      raise ArgumentError if (operand1.nil? || operand2.nil?)
      raise ZeroDivisionError if (operand1.to_f.zero? && operator == '/')
      result = operand1.send(OPERATOR_METHOD[operator], operand2)
      @stack.push(result)
   end

   def save(value)
       @stack.push(value)
   end

   def isNumeric?(text)
      return true if Float(text) rescue false
   end

   def isOperator?(text)
      return OPERATOR_METHOD.include?(text)
   end

end
