class Date 
    attr_reader :day, :month, :year
    def initialize(args)
        @day = args[:day]
        @month = args[:month]
        @year = args[:year]
    end

    def minutes
        @month.amount_of_minutes_since_start_of_year(@day.amount) + @year.amount
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
        # binding.pry
        begin
            month = MonthFactory::from_minutes(last_minutes)
        rescue
            if last_minutes > MonthFactory.build(1).minutes
                previous_year = year.value - 1
                year = Year.new(previous_year)
                last_minutes = minutes - year.amount
                month = MonthFactory::from_minutes(last_minutes)
                day = Day.new(month.amount)
                return Date.new({
                    :day => day,
                    :month => month,
                    :year => year
                })
            else
                month = MonthFactory.build(1)
            end
        end
        last_minutes = last_minutes - month.amount_of_minutes_since_start_of_year(0)
        begin 
            day = Day::from_minutes(last_minutes)
        rescue 
            if month.value > 1
                previous_month = month.value - 1
            else
                previous_month = 12
                previous_year = year.value - 1
                year = Year.new(previous_year)
            end
            month = MonthFactory.build(previous_month)
            day = Day.new(month.amount)
        end
        return Date.new({
            :day => day,
            :month => month,
            :year => year
        })
    end
end