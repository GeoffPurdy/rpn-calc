require_relative "rpn_calc"
require "test/unit"

class TestRpnCalc < Test::Unit::TestCase
   #The calculator should use standard input and standard output, 
   #unless the language makes that impossible.

   #It should implement the four standard arithmetic operators.
   def test_add
      calc = RpnCalc.new()
      calc.enter(1)
      calc.enter(2)
      calc.enter('+')
      assert_equal(3, calc.display(), "Add operation yielded incorrect result")
   end

   def test_subtract
      calc = RpnCalc.new()
      calc.enter(3)
      calc.enter(2)
      calc.enter('-')
      assert_equal(1, calc.display(), "Subtract yielded incorrect result")
   end

   def test_multiply
      calc = RpnCalc.new()
      calc.enter(4)
      calc.enter(3)
      calc.enter('*')
      assert_equal(12, calc.display(), "Multiply yielded incorrect result")
   end

   def test_divide
      calc = RpnCalc.new()
      calc.enter(12)
      calc.enter(6)
      calc.enter('/')
      assert_equal(2, calc.display(), "Divide yielded incorrect result")
   end

   def test_multiple_operations
      calc = RpnCalc.new()
      calc.enter(2)
      calc.enter(9)
      calc.enter(3)
      calc.enter('+')
      calc.enter('*')
      assert_equal(24, calc.display(), "Multiple operations yielded incorrect result")
   end

   def test_integer_division
      calc = RpnCalc.new()
      calc.enter(3)
      calc.enter(2)
      calc.enter('/')
      assert_equal(1.5, calc.display(), "Integer division yielded incorrect result")
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
      calc.enter(1)
      calc.enter(0)
      assert_raise(ZeroDivisionError) do 
         calc.enter('/')
      end
   end

   def test_arity
      calc = RpnCalc.new()
      calc.enter(7)
      assert_raise(ArgumentError) do
         calc.enter('+')
      end
   end

   def test_integer_overflow
      large_int = Integer::MAX
      calc.enter(large_int)
      calc.enter(1)
      calc.enter('+')
      assert(calc.display() > large_number)
   end

   def test_float_overflow
      calc = RpnCalc.new()
      large_float = Float::MAX
      calc.enter(large_float)
      calc.enter(1)
      calc.enter('+')
      assert(calc.display() > large_float)
   end

   def test_integer_division_result_type
      calc = RpnCalc.new()
      calc.enter(8)
      calc.enter(4)
      calc.enter('/')
      assert(calc.display().integer?)
   end

   def test_float_division_result_type
      calc = RpnCalc.new()
      calc.enter(9.0)
      calc.enter(2.0)
      calc.enter('/')
      assert(calc.display().is_a?(Numeric) && !calc.display().integer?)
   end

   def test_mixed_operand_result_type
      calc = RpnCalc.new()
      calc.enter(5.0)
      calc.enter(3)
      calc.enter('*')
      assert(calc.display().is_a?(Numeric) && !calc.display().integer?)
   end
end
