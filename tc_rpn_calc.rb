require_relative "rpn_calc"
require "test/unit"

class TestRpnCalc < Test::Unit::TestCase
   #The calculator should use standard input and standard output, 
   #unless the language makes that impossible.

   #It should implement the four standard arithmetic operators.

   #It should support negative and decimal numbers, 
   #and should not have arbitrary limits on the number of operations.
   def test_numeric
      assert_equal( true, RpnCalc.new().isNumeric?('0'), "Failed to identify integer as numeric")
      assert_equal( true, RpnCalc.new().isNumeric?('0.0'), "Failed to identify float as numeric")
      assert_equal( false, RpnCalc.new().isNumeric?('A'), "Misidentified non decimal input as numeric")
      assert_equal( false, RpnCalc.new().isNumeric?(nil), "Misidentified nil as numeric")
   end

   #The calculator should not allow invalid or undefined behavior.

   #The calculator should exit when it receives a q command 
   #or an end of input indicator (EOF).
   def test_quit
      assert_equal( true, RpnCalc.new().isQuit?('q'), "Failed to quit on q" )
      assert_equal( true, RpnCalc.new().isQuit?(nil), "Failed to quit on EOF")
      assert_equal( false, RpnCalc.new().isQuit?('0'), "Quit when should not")
   end
end
