##
# author: Henrique Bock Belloube 
# date: 2018-04-30 00:33
##

require './minutetable'
require './hour'
require './day'
require './month_factory'
require './year'
require './ttime'
require './date'
require './datetime'
require 'pry'


class Utils
    def self.change_date(date, op, value)
        @op = op
        unless ["-","+"].include?(@op)
            raise ArgumentError.new("Only plus/minus signal is available")
        end
        @value = value.to_i.abs 
        @datetime_initial_array = date.split(" ")
        @date_array = @datetime_initial_array[0].split("/")
        @time_array = @datetime_initial_array[1].split(":")
        
        @datetime = Datetime.new({
            :day => @date_array[0].to_i,
            :month => @date_array[1].to_i,
            :year => @date_array[2].to_i,
            :hour => @time_array[0].to_i,
            :minutes => @time_array[1].to_i
        })
        minutes = @datetime.minutes
        minutes_result = eval([@datetime.minutes,@op,@value].join(" "))
        puts minutes_result
        @date_time_result = Datetime::from_minutes(minutes_result)
        return @date_time_result.to_s
    end
end

# puts(Utils.change_date("01/04/2010 23:00", '-', 1441))
puts(Date::from_minutes(1056586979).to_s)

# myday = Day.new()
# puts myday.amount

