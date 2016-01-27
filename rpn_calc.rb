class RpnCalc
  # RPN Calculator - operates on values in Reverse Polish Notation format
  #   see - https://en.wikipedia.org/wiki/Reverse_Polish_notation

  # map operators to the actual methods they call
  OPERATOR_METHOD = Hash['+' => '+', '-' => '-', '*' => '*', '/' => 'fdiv']

  def initialize
    @stack = []
  end

  def display
    # show next element queued to pop, does not alter stack
    @stack.last || 0
  end

  def enter(input)
    # input a value or operator into the calculator
    if numeric?(input)
      save(input.to_f)
    elsif operator?(input)
      calculate(input)
    else
      fail ArgumentError
    end
  end

  def calculate(operator)
    # perform calculation when operator encountered
    # put result back on stack
    operand1, operand2 = @stack.pop(2)
    fail ArgumentError if operand1.nil? || operand2.nil?
    fail ZeroDivisionError if operand2.zero? && operator == '/'
    result = operand1.send(OPERATOR_METHOD[operator], operand2)
    @stack.push(result)
  end

  def stackdump
    @stack.to_s
  end

  def save(value)
    @stack.push(value)
  end

  def numeric?(text)
    return true if Float(text)
  rescue
    false
  end

  def operator?(text)
    OPERATOR_METHOD.include?(text)
  end
end
