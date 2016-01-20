class RpnCalc

   # map operators to the actual methods they call 
   OPERATOR_METHOD = Hash["+" => "+", "-" => "-", "*" => "*", "/" => "fdiv"]

   def initialize
      @stack = []
   end

   def display()
      return @stack.last || 0
   end

   def enter(input)
      if( isNumeric?(input) )
         save(input.to_f)
      elsif( isOperator?(input) )
         calculate(input)
      else
         raise ArgumentError 
      end
   end

   def calculate(operator)
      operand1, operand2 = @stack.pop(2)
      raise ArgumentError if (operand1.nil? || operand2.nil?)
      raise ZeroDivisionError if (operand2.to_f.zero? && operator == '/')
      result = operand1.to_f.send(OPERATOR_METHOD[operator], operand2.to_f)
      @stack.push(result)
   end

   def stackdump()
      return @stack.to_s
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
