module DateFromNowInWords
  class Railtie < Rails::Railtie
    initializer 'date_from_now_in_words.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
