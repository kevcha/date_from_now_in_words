require 'spec_helper'

describe DateFromNowInWords do
  describe '.date_from_now_in_words' do
    it 'returns human readable strings for dates in future' do
      travel_to Time.new(2016, 03, 8, 12, 0, 0) do
        expect(date_from_now_in_words(3.hours.from_now)).to eq('today')
        expect(date_from_now_in_words(1.days.from_now)).to eq('tomorrow')
        expect(date_from_now_in_words(2.days.from_now)).to eq('next thursday')
        expect(date_from_now_in_words(3.days.from_now)).to eq('next friday')
        expect(date_from_now_in_words(4.days.from_now)).to eq('next saturday')
        expect(date_from_now_in_words(5.days.from_now)).to eq('next sunday')
        expect(date_from_now_in_words(6.days.from_now)).to eq('next monday')
        expect(date_from_now_in_words(7.days.from_now)).to eq('next tuesday')

        expect(date_from_now_in_words(8.days.from_now)).to eq('in 8 days')
        expect(date_from_now_in_words(10.days.from_now)).to eq('in 10 days')
        expect(date_from_now_in_words(15.days.from_now)).to eq('in 15 days')
        expect(date_from_now_in_words(20.days.from_now)).to eq('in 20 days')
        expect(date_from_now_in_words(25.days.from_now)).to eq('in 25 days')

        expect(date_from_now_in_words(29.days.from_now)).to eq('in about 1 month')
        expect(date_from_now_in_words(30.days.from_now)).to eq('in about 1 month')
        expect(date_from_now_in_words(44.days.from_now)).to eq('in about 1 month')

        expect(date_from_now_in_words(45.days.from_now)).to eq('in about 2 months')
        expect(date_from_now_in_words(344.days.from_now)).to eq('in about 11 months')

        expect(date_from_now_in_words(350.days.from_now)).to eq('in about 1 year')
      end
    end

    it 'returns human readable strings for dates in past' do
      travel_to Time.new(2016, 03, 8, 12, 0, 0) do
        expect(date_from_now_in_words(3.hours.ago)).to eq('today')
        expect(date_from_now_in_words(1.days.ago)).to eq('yesterday')
        expect(date_from_now_in_words(2.days.ago)).to eq('last sunday')
        expect(date_from_now_in_words(3.days.ago)).to eq('last saturday')
        expect(date_from_now_in_words(4.days.ago)).to eq('last friday')
        expect(date_from_now_in_words(5.days.ago)).to eq('last thursday')
        expect(date_from_now_in_words(6.days.ago)).to eq('last wednesday')
        expect(date_from_now_in_words(7.days.ago)).to eq('last tuesday')

        expect(date_from_now_in_words(8.days.ago)).to eq('8 days ago')
        expect(date_from_now_in_words(10.days.ago)).to eq('10 days ago')
        expect(date_from_now_in_words(15.days.ago)).to eq('15 days ago')
        expect(date_from_now_in_words(20.days.ago)).to eq('20 days ago')
        expect(date_from_now_in_words(25.days.ago)).to eq('25 days ago')

        expect(date_from_now_in_words(29.days.ago)).to eq('about 1 month ago')
        expect(date_from_now_in_words(30.days.ago)).to eq('about 1 month ago')
        expect(date_from_now_in_words(44.days.ago)).to eq('about 1 month ago')

        expect(date_from_now_in_words(45.days.ago)).to eq('about 2 months ago')
        expect(date_from_now_in_words(344.days.ago)).to eq('about 11 months ago')

        expect(date_from_now_in_words(350.days.ago)).to eq('about 1 year ago')
      end
    end
  end

  private

  def date_from_now_in_words(date)
    @helper ||= Helper.new
    @helper.date_from_now_in_words(date)
  end
end
