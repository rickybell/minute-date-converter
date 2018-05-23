require './minutetable'
require './hour'
require './day'
require './month_factory'
require './year'
require './ttime'
require './date'
require './datetime'
require 'pry'

describe Year do
    describe '.new' do
        before(:each) do
            @year = Year.new(2010)
        end
        context 'after create' do
            it "should be a valid 'Year' object" do
                expect(@year).to be_kind_of(Year)
            end
            describe '#value' do 
                it "should be equal to initialization value parameter" do
                    expect(@year.value).to be(2010)
                end
            end
            describe '#amount' do 
                it 'should equal amount minutes of value' do
                    expect(@year.amount).to be(1056456000)
                end
            end
            describe '#to_s' do
                it "print 'value' formated like 'YYYY'" do
                    expect(@year.to_s).equal? '2010'
                end
            end

            
        end
        context "when convert amount of minutes to 'Year' object" do
            describe '::from_minutes' do 
                subject(:year) { Year::from_minutes(1056456000) }
                it { should be_kind_of(Year)}
                it { year.value.should == 2010} 
            end
        end
    end
end