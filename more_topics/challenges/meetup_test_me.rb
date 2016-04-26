require 'minitest/autorun'
require 'date'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'meetup'

class MeetupTest < Minitest::Test

  def test_new
    this_year = Meetup.new(04, 2016)
    assert_equal(2016, this_year.year)
    assert_equal(4, this_year.month)
  end

  def test_day
    
  end
end