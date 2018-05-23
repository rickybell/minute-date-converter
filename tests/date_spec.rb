require './minutetable'
require './hour'
require './day'
require './month_factory'
require './year'
require './ttime'
require './date'
require './datetime'
require 'pry'

describe Date do
    context 'simple date' do
        context 'after creation' do 
            subject(:date)  { Date.new(
                    {
                        :day => Day.new(3),
                        :month => MonthFactory.build(3),
                        :year => Year.new(2010)
                    }
            )}
            describe '.new' do
                it "date should be 'Date' valid class" do
                    expect(date.day.value).to eq(3)
                end
                it "month should be 'Month' valid class" do
                    expect(date.month.amount).to eq(31)
                end
                it "year should be 'Year' valid class" do
                    expect(date.year.value).to eq(2010)
                end
            end
            describe '#minutes' do
                it  "should return the total amount of minutes from Date" do 
                    expect(date.minutes).to eq(1056545280)
                end
            end
            describe '#to_s' do 
                it 'should print like a format DD/MM/YYYY' do
                    expect(date.to_s).to eq('03/03/2010')
                end
            end
        end
    end
    context "when have only amount of minutes" do    
        describe '::from_minutes' do
            subject(:date) {Date::from_minutes(1056545280)}
            it { should be_kind_of(Date)}
            it {date.day.value.should == 3}
            it {date.month.value.should == 3}
            it {date.year.value.should == 2010}
        end
    end
    context 'when with a value of days low then one complete day' do
        subject(:date) {Date::from_minutes(1056586979)}
        it { should be_kind_of(Date)}
        it {date.day.value.should == 31}
        it {date.month.value.should == 3}
        it {date.year.value.should == 2010}
    end

    context 'when with have a value of month low then one complete month' do
        subject(:date) {Date::from_minutes(1056458820)} # 1/1/2010
        it { should be_kind_of(Date)}
        it {date.day.value.should == 1}
        it {date.month.value.should == 1}
        it {date.year.value.should == 2010}
    end
end