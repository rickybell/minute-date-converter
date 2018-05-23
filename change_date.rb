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

# puts(Utils.change_date("01/01/2010 23:00", '+', 1440))

# myday = Day.new()
# puts myday.amount
# 1/1/2010 23:00 = 1056458820
# @datetime = Datetime.new({
#             :day => 1,
#             :month => 1,
#             :year => 2010,
#             :hour => 23,
#             :minutes => 00
#         })
# @datetime = Datetime::from_minutes(1056454560)
# puts @datetime.to_s


# @datetime = Datetime::from_minutes(1056460260)
# puts @datetime.to_s

# @date = Date.new({
#     :day => Day.new(1),
#     :month => MonthFactory.build(1),
#     :year => Year.new(2010)
# })
# puts @date.minutes

# @datetime = Datetime.new({
#     :day => 1,
#     :month => 1,
#     :year => 2010,
#     :hour => 23,
#     :minutes => 00
# })
# puts "x " + @datetime.to_s
# puts @datetime.minutes
# puts(Utils.change_date("01/03/2010 23:00", '-', 1440))
puts(Datetime.from_minutes(1056458820).to_s)
# puts(Date.from_minutes(1056461700).to_s)


