ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module TestCase
  # Active Support
  class ActiveSupport
    fixtures :all
  end
end
