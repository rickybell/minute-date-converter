require 'rspec_spec.rb'

describe Ttime do
    context 'simple time object' do 
        let(:ttime)  {
            described_class.new (
                { 
                    :hour => Hour.new(10),
                    :minutes => 20 
                }
            )
        }    
        describe ".new" do
            context 'after creation' do
                it "should be kind of Ttime" do 
                    expect(ttime).is_a?(Ttime)
                end
                it "have a valid 'hour' value" do
                    expect(ttime.hour.value).equal? 10
                end
                it "have a minutes value" do
                    expect(ttime.minutes).equal? 20
                end
            end
        end
        describe "#minutes" do
            it "should return amount of minutes" do
                expect(ttime.minutes).equal? 620
            end
        end
        describe "#to_s" do
            it 'should print like format HH:MM' do
                expect(ttime.to_s).to eq("10:20")
            end
        end
    end
    context "when have a amount of minutes" do 
        describe '::from_minutes' do
            subject(:ttime) {Ttime::from_minutes(521)}
            it { should be_kind_of(Ttime)}
            it {ttime.hour.value.should == 8}
            it {ttime.mins.should == 41}
        end
    end
end