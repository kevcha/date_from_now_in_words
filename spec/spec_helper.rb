require 'active_support/test_case'
require 'date_from_now_in_words'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

include ActiveSupport::Testing::TimeHelpers

class Helper
  include DateFromNowInWords::ViewHelpers
end
