require 'date'

class Meetup

WEEK = {
  first: (1..7),
  second: (8..14),
  third: (15..21),
  fourth: (22..28),
  teenth: (13..19)
}

  def day(weekday, week) 
    @weekday = weekday
    if week == :last
      week = (0..6).map { |d| no_days_in_month - d }
      date = find_date(week)
    else
      date = find_date(WEEK[week])
    end
     Date.new(@year, @month, date)
  end

  private

  def initialize(month, year)
    @year = year
    @month = month
  end

  def no_days_in_month
    Date.new(@year, @month, -1).day
  end

  def find_date(range)
    range.detect do |d| 
      test_date = Date.new(@year, @month, d)
      test_date.strftime("%A") == "#{@weekday}".capitalize
    end
  end
end




