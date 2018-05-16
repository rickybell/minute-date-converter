class Date 
    attr_reader :day, :month, :year
    def initialize(args)
        @day = args[:day]
        @month = args[:month]
        @year = args[:year]
    end

    def minutes
        @month.amount_of_minutes_since_start_of_year(@day) + @year.amount
    end

    def to_s
        [
            @day.to_s,
            @month.to_s,
            @year.to_s
        ].join("/")
    end

    def self.from_minutes(minutes)
        year = Year::from_minutes(minutes)
        last_minutes = minutes - year.amount
        month = MonthFactory::from_minutes(last_minutes)
        last_minutes = last_minutes - month.amount_of_minutes_since_start_of_year(Day.new(0))
        day = Day::from_minutes(last_minutes)
        return Date.new({
            :day => day,
            :month => month,
            :year => year
        })
    end
end