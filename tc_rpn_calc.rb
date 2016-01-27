require_relative 'rpn_calc'
require 'test/unit'

class TestRpnCalc < Test::Unit::TestCase
  # The calculator should use standard input and standard output,
  # unless the language makes that impossible.

  # It should implement the four standard arithmetic operators.
  def test_integer_add
    calc = RpnCalc.new
    calc.enter(1)
    calc.enter(2)
    calc.enter('+')
    assert_equal(3, calc.display)
  end

  def test_float_add
    calc = RpnCalc.new
    calc.enter(1.2)
    calc.enter(2.5)
    calc.enter('+')
    assert_equal(3.7, calc.display)
  end

  def test_integer_subtract
    calc = RpnCalc.new
    calc.enter(3)
    calc.enter(2)
    calc.enter('-')
    assert_equal(1, calc.display)
  end

  def test_float_subtract
    calc = RpnCalc.new
    calc.enter(3.3)
    calc.enter(2.2)
    calc.enter('-')
    assert_equal(1.1, calc.display.round(2)) # float arithmetic imprecise
  end

  def test_integer_multiply
    calc = RpnCalc.new
    calc.enter(4)
    calc.enter(3)
    calc.enter('*')
    assert_equal(12, calc.display)
  end

  def test_float_multiply
    calc = RpnCalc.new
    calc.enter(4)
    calc.enter(3.0)
    calc.enter('*')
    assert_equal(12.0, calc.display)
  end

  def test_divide
    calc = RpnCalc.new
    calc.enter(12)
    calc.enter(6)
    calc.enter('/')
    assert_equal(2.0, calc.display)
  end

  def test_multiple_operations
    calc = RpnCalc.new
    calc.enter(2)
    calc.enter(9)
    calc.enter(3)
    calc.enter('+')
    calc.enter('*')
    assert_equal(24, calc.display)
  end

  # It should support negative and decimal numbers,
  # and should not have arbitrary limits on the number of operations.
  def test_numeric
    assert_equal(true, RpnCalc.new.numeric?('0'))
    assert_equal(true, RpnCalc.new.numeric?('0.0'))
    assert_equal(true, RpnCalc.new.numeric?('-0'))
    assert_equal(true, RpnCalc.new.numeric?('-0.0'))
    assert_equal(false, RpnCalc.new.numeric?('A'))
    assert_equal(false, RpnCalc.new.numeric?('-E'))
    assert_equal(false, RpnCalc.new.numeric?(nil))
  end

  # The calculator should not allow invalid or undefined behavior.
  def test_divide_by_zero
    calc = RpnCalc.new
    calc.enter(1)
    calc.enter(0)
    assert_raise(ZeroDivisionError) do
      calc.enter('/')
    end
  end

  def test_arity
    calc = RpnCalc.new
    calc.enter(7)
    assert_raise(ArgumentError) do
      calc.enter('+')
    end
  end
end
