require 'rspec'
require './minutetable'
require './ttime'
require './hour'
require './date'
require './month_factory'
require './day'
require './datetime'
require './year'
require 'pry'

describe Datetime do
    context 'simple datetime' do
        let(:datetime) {
            described_class.new(
                {
                    :day => 15,
                    :month => 5,
                    :year => 2010,
                    :hour => 12,
                    :minutes => 48
                }
            )
        }
        describe ".new" do
            context "after creation" do
                it "should be kind of 'Datetime'" do
                    expect(datetime).is_a?(Datetime)
                end
                it "should datetime have 'Date' object definied" do
                    expect(datetime.date).is_a?(Date)
                end
                it "should datetime have 'Ttime' object definied" do
                    expect(datetime.time).is_a?(Ttime)
                end
            end
        end
        describe "#minutes" do
            it 'should return amount of minutes' do
                expect(datetime.minutes).to eq(1056651168)
            end
        end

        describe "#to_s" do
            it "should print like format 'DD/MM/YYYY HH:MM'" do
                expect(datetime.to_s).to eq("15/05/2010 12:48" )
            end
        end
    end

    context "when have only amount of minutes to create object" do
        describe "::from_minutes" do
            subject(:datetime) { Datetime::from_minutes(1056651168)}
            it { should be_kind_of(Datetime)}
            # it { datetime.data.to_s.should == "15/05/2010"}
            # it { datetime.time.to_s.should == "12:48" }
        end
    end
end