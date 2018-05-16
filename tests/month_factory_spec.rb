require 'rspec_spec'

describe MonthFactory do
    describe '.build' do
        context 'month with 31 days' do
            subject(:month31) { MonthFactory.build(1) }
            it { should be_kind_of(Month31)}
        end
        context 'month with 30 days' do
            subject { MonthFactory.build(4) }
            it { should be_kind_of(Month30)}
        end
        context 'month with 28 days' do
            subject { MonthFactory.build(2) }
            it { should be_kind_of(Month28)}

        end
    end
    describe '#value' do 
        describe 'should return the value creation' do
            context 'month with 31 days' do
                subject(:month) { MonthFactory.build(1) }
                it {month.value.should == 1}
            end
            context 'month with 30 days' do
                subject(:month) { MonthFactory.build(4) }
                it { month.value.should == 4 }
            end
            context 'month with 28 days' do
                subject(:month) { MonthFactory.build(2) }
                it { month.value.should == 2 }
            end
        end
    end

    describe '#minutes' do 
        describe 'any month should return minutes from your amount of days' do
            context 'month with 31 days' do
                subject(:month) { MonthFactory.build(3) }
                it { month.minutes.should == 44640 }
            end
            context 'month with 30 days' do
                subject(:month) { MonthFactory.build(4) }
                it { month.minutes.should == 43200 }
            end
            context 'month with 28 days' do
                subject(:month) { MonthFactory.build(2) }
                it { month.minutes.should == 40320 }
            end
        end
    end
    describe '#amount' do 
        describe 'any month should return amount of days ' do
            context 'month with 31 days' do
                subject(:month) { MonthFactory.build(3) }
                it { month.amount.should == 31 }
            end
            context 'month with 30 days' do
                subject(:month) { MonthFactory.build(4) }
                it { month.amount.should == 30 }
            end
            context 'month with 28 days' do
                subject(:month) { MonthFactory.build(2) }
                it { month.amount.should == 28 }
            end
        end
    end

    describe '#amount_of_minutes_since_start_of_year' do
        describe 'amount minutes' do
            context 'for year and days of incomplete month' do
                subject(:month) { MonthFactory.build(4) }
                it { month.amount_of_minutes_since_start_of_year(Day.new(5)).should ==  136800 }
            end
        end
    end

    describe '#to_s' do
        describe "print 'value' formated like 'MM'" do
            subject(:month) {MonthFactory.build(5)}
            it {month.to_s.should == '05'}
        end
    end

    describe '::from_minutes' do
        context "when convert amount of minutes to 'Month' object" do
            subject(:month) { MonthFactory::from_minutes(89280)}
            it { should be_kind_of(Month31)}
            it { month.value.should == 3}
        end
    end
end