class Datetime
    attr_reader :date, :time
    def initialize(args)
        day = Day.new(args.fetch(:day,0))
        month = MonthFactory.build(args.fetch(:month,0))
        year = Year.new(args.fetch(:year,0))
        @date = Date.new({
            :day => day,
            :month => month,
            :year => year,
        })
        @time = Ttime.new({
            :hour => Hour.new(args.fetch(:hour,0).to_i)  ,
            :minutes => args.fetch(:minutes,0).to_i
        })
    end

    def minutes
        return @date.minutes + @time.minutes
    end

    def to_s
        return [
            date,
            time,
        ].join(" ")
    end

    def self.from_minutes(minutes)
        from_date = Date::from_minutes(minutes)
        from_time = Ttime::from_minutes(minutes - from_date.minutes)
        return Datetime.new({
            :day => from_date.day.value,
            :month => from_date.month.value,
            :year => from_date.year.value,
            :hour => from_time.hour.value,
            :minutes => from_time.mins 
        })
    end

end