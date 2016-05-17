require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'rough_working'

class TestTable < MiniTest::Test
  def test_initialize
    
    assert_raises(TableException) {t = Table.new} 
  end
end