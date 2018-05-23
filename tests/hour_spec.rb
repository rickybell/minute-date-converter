require './minutetable'
require './hour'
require './day'
require './month_factory'
require './year'
require './ttime'
require './date'
require './datetime'
require 'pry'

describe Hour do
    before(:each) do
        @hour = Hour.new(3)
    end
    describe '.new' do
        it "should be a 'Hour' valid object" do
            expect(@hour).not_to be_nil
        end
    end
    
    describe '#value' do
        it "should returned 'value' equal to 'new' parameter" do
            expect(@hour.value).to be_equal(3)
        end
    end

    describe '#amount' do
        it "should be equal the minutes total of hours" do 
            expect(@hour.amount).to be_equal(180)
        end
    end

    describe '#minutes' do
        it "should hour return minutes from a hour" do 
            expect(@hour.minutes).to be_equal(60)
        end
    end
    context "when have a amount of minutes" do
        subject(:hour) { Hour::from_minutes(521)}
        it { should be_kind_of(Hour)}
        it { hour.value.should == 8}
    end
end