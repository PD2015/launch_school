require 'date'
require 'pry'

class Meetup

attr_reader :year, :month
WEEK = {
  first: (1..7),
  second: (8..14),
  third: (15..21),
  fourth: (22..28),
  teenth: (13..19),
  last: (-7..-1)
}
WEEK_DAYS = {
  :monday => "Monday",
  :tuesday => "Tuesday",
  :wednesday => "Wednesday",
  :thursday => "Thursday",
  :friday => "Friday",
  :saturday => "Saturday",
  :sunday => "Sunday"
}

  def initialize(month, year)
    @year = year
    @month = month
  end

  def day(weekday, week) 
    if week == :last
      week = (-6..0).map do |d|
      days_in_month + d
      end
       date = week.detect do |d|
        test_date = Date.new(@year, @month, d)
        test_date.strftime("%A") == WEEK_DAYS[weekday]
        end
    else
      date = WEEK[week].detect do |d|
        test_date = Date.new(@year, @month, d)
        test_date.strftime("%A") == WEEK_DAYS[weekday]
      end
    end

     Date.new(@year, @month, date)
  end

  def days_in_month(default1 = month, default2 =year)
    Date.new(default2, default1, -1).day
  end

  def display
    puts WEEK
  end
end

meetup = Meetup.new(7, 2013)
# p meetup.days_in_month
 # p meetup.day(:wednesday, :last)
# p meetup.day(:tuesday, :first)
# Meetup.new(5, 2013).day(:tuesday, :first)
# Meetup.new(7, 2013).day(:wednesday, :last)



