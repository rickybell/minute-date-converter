class Year
    include Minutetable
    AMOUNT_DAYS = 365
    AMOUNT_MINUTES = Year::AMOUNT_DAYS * Day::HOURS_OF_DAY * Hour::AMOUNT_MINUTES
    def initialize(value = nil)
        super(value)
        @minutes = Year::AMOUNT_MINUTES
    end
    def to_s 
        sprintf('%04d',@value)
    end

    def self.from_minutes(minutes)
        result = minutes/AMOUNT_MINUTES
        return Year.new(result)
    end
end