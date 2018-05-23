
class Month
    include Minutetable 
    @amount = 0
    def initialize(value = nil)
        super(value)
        @minutes = @amount * Day::AMOUNT_MINUTES
    end
    def amount
        @amount
    end

    def amount_of_minutes_since_start_of_year(day_of_month)
        i = 1
        amount_of_minutes = 0
        until i >= value.to_i do 
            amount_of_minutes = amount_of_minutes + MonthFactory::build(i).minutes
            i += 1
        end
        amount_of_minutes = amount_of_minutes + day_of_month
    end

    def to_s
        sprintf('%02d',value)
    end
end

class Month30 < Month
    def initialize(value = nil)
        @amount = 30
        super(value)
    end
end

class Month31 < Month
    def initialize(value = nil)
        @amount = 31
        super(value) 
    end
end
class Month28 < Month
    def initialize(value = nil)
        @amount = 28
        super(value)
    end
end

class MonthFactory
    def self.build(month_in_number)
        my_return = nil
        if [1,3,5,7,8,10,12].include?(month_in_number) then 
            my_return = Month31.new(month_in_number)
        elsif [4,6,9,11].include?(month_in_number) then
            my_return = Month30.new(month_in_number)
        elsif month_in_number == 2 then
            my_return = Month28.new(month_in_number)
        else
            raise ArgumentError.new("Month: Invalid value, value between 1 and 12.")
        end
        return my_return
    end
    def self.from_minutes(minutes)
        last_minutes = minutes
        i = 0
        begin
            until last_minutes < 0 
                if (last_minutes/MonthFactory::build(i + 1).minutes) > 0 
                    last_minutes = last_minutes - MonthFactory::build(i + 1).minutes
                    i += 1
                else
                    i = (i > 0 ? i + 1 : 0)
                    break
                end 
            end
        rescue
        end
        return MonthFactory::build(i)
    end
end