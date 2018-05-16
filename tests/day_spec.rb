require './minutetable'
require './hour'
require './day'
require './month_factory'
require './year'
require './ttime'
require './date'
require './datetime'
require 'pry'

describe Day do
    before(:each) do
        @day = Day.new(3)
    end
    describe '.new' do
        context 'Simple Day' do
            it "should be a valib object, after create" do
                expect(@day).not_to be_nil
            end
        end
        # it "Invalid value, greater then 0" do
        #     expect(Day.new(0)).to raise_error(StandardError,"Value should be greater then 0")
        # end
    end
    describe '#value' do
        it "after create, value should be equal to initalization value parameter" do
            expect(@day.value).to be(3)
        end
    end
    describe '#amount' do
        it "should 'amount', equal the minutes of value" do
            expect(@day.amount).to be(4320)
        end
    end

    describe '.minutable' do
        it "should give a number o hour, Day show calculate de minutes" do 
            expect(@day.calculate(2)).to be(2880)
        end
    end

    describe '#to_s' do 
        it "should print like a format DD" do
            expect(@day.to_s).equal? "03"
        end
    end

    context 'when need create a object from a amount of minutes' do
        describe '::from_minutes' do
            subject(:day) { Day::from_minutes(4320)}
            it { should be_kind_of(Day)}
            it { day.value.should == 3}
        end
    end
    
end