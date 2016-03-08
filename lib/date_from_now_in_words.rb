require 'active_support'
require 'active_support/core_ext'

require 'date_from_now_in_words/version'
require 'date_from_now_in_words/view_helpers'
require 'date_from_now_in_words/railtie' if defined?(Rails)

I18n.load_path << File.expand_path(File.dirname(__FILE__) + '/../config/locales/en.yml')
