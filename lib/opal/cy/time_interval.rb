module CY
  class TimeInterval
    include CY::Native

  #  alias_native :round
  #  alias_native :floor
  #  alias_native :ceil
  #  alias_native :offset
  #  alias_native :range
  #  alias_native :count
    alias_native_new :every

    def filter(&block)
      CY::TimeInterval.new(@native.JS.filter(block))
    end
  end

  class << self
    def time_year; CY::TimeInterval.new(`window.d3.timeYear`); end
    def utc_year; CY::TimeInterval.new(`window.d3.utcYear`); end
    def time_month; CY::TimeInterval.new(`window.d3.timeMonth`); end
    def utc_month; CY::TimeInterval.new(`window.d3.utcMonth`); end
    def time_week; CY::TimeInterval.new(`window.d3.timeWeek`); end
    def utc_week; CY::TimeInterval.new(`window.d3.utcWeek`); end
    def time_monday; CY::TimeInterval.new(`window.d3.timeMonday`); end
    def utc_monday; CY::TimeInterval.new(`window.d3.utcMonday`); end
    def time_tuesday; CY::TimeInterval.new(`window.d3.timeTuesday`); end
    def utc_tuesday; CY::TimeInterval.new(`window.d3.utcTuesday`); end
    def time_wednesday; CY::TimeInterval.new(`window.d3.timeWednesday`); end
    def utc_wednesday; CY::TimeInterval.new(`window.d3.utcWednesday`); end
    def time_thursday; CY::TimeInterval.new(`window.d3.timeThursday`); end
    def utc_thursday; CY::TimeInterval.new(`window.d3.utcThursday`); end
    def time_friday; CY::TimeInterval.new(`window.d3.timeFriday`); end
    def utc_friday; CY::TimeInterval.new(`window.d3.utcFriday`); end
    def time_saturday; CY::TimeInterval.new(`window.d3.timeSaturday`); end
    def utc_saturday; CY::TimeInterval.new(`window.d3.utcSaturday`); end
    def time_sunday; CY::TimeInterval.new(`window.d3.timeSunday`); end
    def utc_sunday; CY::TimeInterval.new(`window.d3.utcSunday`); end
    def time_day; CY::TimeInterval.new(`window.d3.timeDay`); end
    def utc_day; CY::TimeInterval.new(`window.d3.utcDay`); end
    def time_hour; CY::TimeInterval.new(`window.d3.timeHour`); end
    def utc_hour; CY::TimeInterval.new(`window.d3.utcHour`); end
    def time_minute; CY::TimeInterval.new(`window.d3.timeMinute`); end
    def utc_minute; CY::TimeInterval.new(`window.d3.utcMinute`); end
    def time_second; CY::TimeInterval.new(`window.d3.timeSecond`); end
    def utc_second; CY::TimeInterval.new(`window.d3.utcSecond`); end
    def time_millisecond; CY::TimeInterval.new(`window.d3.timeMillisecond`); end
    def utc_millisecond; CY::TimeInterval.new(`window.d3.utcMillisecond`); end

    alias_d3 :timeYears
    alias_d3 :utcYears
    alias_d3 :timeMilliseconds
    alias_d3 :utcMilliseconds
    alias_d3 :timeSeconds
    alias_d3 :utcSeconds
    alias_d3 :timeMinutes
    alias_d3 :utcMinutes
    alias_d3 :timeHours
    alias_d3 :utcHours
    alias_d3 :timeDays
    alias_d3 :utcDays
    alias_d3 :timeWeeks
    alias_d3 :utcWeeks
    alias_d3 :timeSundays
    alias_d3 :utcSundays
    alias_d3 :timeMondays
    alias_d3 :utcMondays
    alias_d3 :timeTuesdays
    alias_d3 :utcTuesdays
    alias_d3 :timeWednesdays
    alias_d3 :utcWednesdays
    alias_d3 :timeThursdays
    alias_d3 :utcThursdays
    alias_d3 :timeFridays
    alias_d3 :utcFridays
    alias_d3 :timeSaturdays
    alias_d3 :utcSaturdays
    alias_d3 :timeMonths
    alias_d3 :utcMonths
  end
end
