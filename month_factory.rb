
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
            fake_month = MonthFactory::build(i)
            amount_of_minutes = amount_of_minutes + fake_month.minutes
            i += 1
        end
        amount_of_minutes = amount_of_minutes + day_of_month.amount
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
        end
        return my_return
    end
    def self.from_minutes(minutes)
        last_minutes = minutes
        i = 1
        until last_minutes < 0 
            if (last_minutes/MonthFactory::build(i).minutes) > 0
                last_minutes = last_minutes - MonthFactory::build(i).minutes
            else
                break
            end 
            i += 1
        end
        return MonthFactory::build(i)
    end
end