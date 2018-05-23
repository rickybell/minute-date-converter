class Day
    include Minutetable 
    
    HOURS_OF_DAY = 24
    AMOUNT_MINUTES = Day::HOURS_OF_DAY * Hour::AMOUNT_MINUTES
    def initialize(value = nil)
        @message_erro = "Day: Value should be greater then 0"
        super(value)
        @minutes = Day::AMOUNT_MINUTES
    end
    def to_s 
        sprintf('%02d',value)
    end

    def self.from_minutes(minutes)
        days = minutes/AMOUNT_MINUTES
        return Day.new(days)
    end
end