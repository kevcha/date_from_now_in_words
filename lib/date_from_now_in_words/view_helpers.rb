module DateFromNowInWords
  module ViewHelpers
    def date_from_now_in_words(to_date = 0, options = {})
      options = {
        scope: :'date.distance_in_words'
      }.merge!(options)

      from_date = Date.current
      to_date = to_date.to_date if to_date.respond_to?(:to_date)
      distance_in_days = to_date - from_date

      I18n.with_options(options) do |locale|
        case distance_in_days
        when -344..-29
          locale.t(
            :x_months_ago,
            count: (distance_in_days / 30.0).round.abs
          )
        when -28..-8
          locale.t(
            :x_days_ago,
            count: distance_in_days.round.abs
          )
        when -7..-2
          locale.t(
            :last_x,
            day: I18n.t('date.day_names')[to_date.wday].downcase
          )
        when -1
          locale.t(:yesterday)
        when 0
          locale.t(:today)
        when 1
          locale.t(:tomorrow)
        when 2..7
          locale.t(
            :next_x,
            day: I18n.t('date.day_names')[to_date.wday].downcase
          )
        when 8..28
          locale.t(
            :in_x_days,
            count: distance_in_days.round
          )
        when 29..344
          locale.t(
            :in_x_months,
            count: (distance_in_days / 30.0).round
          )
        else
          if distance_in_days > 0
            locale.t(
              :in_x_years,
              count: (distance_in_days / 365).round
            )
          else
            locale.t(
              :x_years_ago,
              count: (distance_in_days / 365).round.abs
            )
          end
        end
      end
    end
  end
end
