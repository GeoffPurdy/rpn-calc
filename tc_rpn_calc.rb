require_relative "rpn_calc"
require "test/unit"

class TestRpnCalc < Test::Unit::TestCase
   #The calculator should use standard input and standard output, 
   #unless the language makes that impossible.

   #It should implement the four standard arithmetic operators.
   def test_add
      calc = RpnCalc.new()
      calc.push('1')
      calc.push('2')
      calc.push('+')
      assert_equal(3, calc.pop(), "Add operation yielded incorrect result")
   end

   def test_subtract
      calc = RpnCalc.new()
      calc.push('3')
      calc.push('2')
      calc.push('-')
      assert_equal(1, calc.pop(), "Subtract yielded incorrect result")
   end

   def test_multiply
      calc = RpnCalc.new()
      calc.push('4')
      calc.push('3')
      calc.push('*')
      assert_equal(12, calc.pop(), "Multiply yielded incorrect result")
   end

   def test_divide
      calc = RpnCalc.new()
      calc.push('12')
      calc.push('6')
      calc.push('/')
      assert_equal(2, calc.pop(), "Divide yielded incorrect result")
   end

   def test_multiple_operations
      calc = RpnCalc.new()
      calc.push('2')
      calc.push('9')
      calc.push('3')
      calc.push('+')
      calc.push('*')
      assert_equal(24, calc.pop(), "Multiple operations yielded incorrect result")
   end

   #It should support negative and decimal numbers, 
   #and should not have arbitrary limits on the number of operations.
   def test_numeric
      assert_equal(true, RpnCalc.new().isNumeric?('0'), "Failed to identify integer as numeric")
      assert_equal(true, RpnCalc.new().isNumeric?('0.0'), "Failed to identify float as numeric")
      assert_equal(true, RpnCalc.new().isNumeric?('-0'), "Failed to identify negative integer as numeric")
      assert_equal(true, RpnCalc.new().isNumeric?('-0.0'), "Failed to identify negative float as numeric")
      assert_equal(false, RpnCalc.new().isNumeric?('A'), "Misidentified non decimal input as numeric")
      assert_equal(false, RpnCalc.new().isNumeric?('-E'), "Misidentified negative non-decimal input as numeric")
      assert_equal(false, RpnCalc.new().isNumeric?(nil), "Misidentified nil as numeric")
   end

   #The calculator should not allow invalid or undefined behavior.
   def test_divide_by_zero
      calc = RpnCalc.new()
      calc.push('1')
      calc.push('0')
      calc.push('/')
      assert(false) #FIXME: figure out how test that divide by zero fails   
   end

   def test_arity
      calc = RpnCalc.new()
      calc.push('7')
      calc.push('+')
      assert(false) #FIXME: figure out how to confirm this fails
   end

   #The calculator should exit when it receives a q command 
   #or an end of input indicator (EOF).
   def test_quit
      assert_equal(true, RpnCalc.new().isQuit?('q'), "Failed to quit on q" )
      assert_equal(true, RpnCalc.new().isQuit?(nil), "Failed to quit on EOF")
      assert_equal(false, RpnCalc.new().isQuit?('0'), "Quit when should not")
   end
end
