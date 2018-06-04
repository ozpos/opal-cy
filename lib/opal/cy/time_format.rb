module CY
  class TimeFormatLocale
    include CY::Native
#    alias_native :format, :format
 #   alias_native :parse, :parse
 #   alias_native :utc_format, :utcFormat
 #   alias_native :utc_parse, :utcParse
  end

  class << self
    alias_d3 :timeFormat
    alias_d3 :timeParse
    alias_d3 :utcFormat
    alias_d3 :utcParse
    alias_d3 :isoFormat
    alias_d3 :isoParse

    def time_format_locale(spec={})
      CY::TimeFormatLocale.new @cy.JS.timeFormatLocale(
        {
          dateTime: spec.fetch(:date_time, "%x, %X"),
          date: spec.fetch(:date, "%-m/%-d/%Y"),
          time: spec.fetch(:time, "%-I:%M:%S %p"),
          periods: spec.fetch(:periods, ["AM", "PM"]),
          days: spec.fetch(:days, ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]),
          shortDays: spec.fetch(:short_days, ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]),
          months: spec.fetch(:months, ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]),
          shortMonths: spec.fetch(:short_months, ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]),
        }.to_n
      )
    end

    def time_format_default_locale(spec={})
      CY::TimeFormatLocale.new @cy.JS.timeFormatDefaultLocale(
        {
          dateTime: spec.fetch(:date_time, "%x, %X"),
          date: spec.fetch(:date, "%-m/%-d/%Y"),
          time: spec.fetch(:time, "%-I:%M:%S %p"),
          periods: spec.fetch(:periods, ["AM", "PM"]),
          days: spec.fetch(:days, ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]),
          shortDays: spec.fetch(:short_days, ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]),
          months: spec.fetch(:months, ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]),
          shortMonths: spec.fetch(:short_months, ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]),
        }.to_n
      )
    end
  end
end
