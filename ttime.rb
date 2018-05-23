
class Ttime
    attr_reader :hour, :mins
    def initialize(args)
        @hour = args.fetch(:hour,Hour.new(1))
        @mins = args.fetch(:minutes,0)
    end

    def minutes
        hour.amount + mins
    end

    def to_s
        [
            sprintf('%02d',hour.value),
            sprintf('%02d',mins),
        ].join(":")
    end

    def self.from_minutes(minutes)
        hour = Hour::from_minutes(minutes)
        mins = minutes - hour.amount
        return Ttime.new({
            :hour => hour,
            :minutes => mins
        }) 
    end
end