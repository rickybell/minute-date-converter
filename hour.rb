class Hour 
    include Minutetable
    AMOUNT_MINUTES = 60
    def initialize(value = nil)
        super(value)
        @amount = Hour::AMOUNT_MINUTES
        @minutes = Hour::AMOUNT_MINUTES
    end

    def self.from_minutes(minutes)
        hours =  minutes/AMOUNT_MINUTES
        return Hour.new(hours)
    end
end

 