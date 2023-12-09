# frozen_string_literal: true

# ENV["RAILS_ENV"] ||= 'test'

# if ENV['RAILS_ENV'] == 'test'
#   require 'simplecov'
#   SimpleCov.start('rails')
#   puts 'required simplecov'
# end

require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # if ENV['RAILS_ENV'] == 'test'
    #   parallelize_setup do |worker|
    #     SimpleCov.command_name "#{SimpleCov.command_name}-#{worker}"
    #   end

    #   parallelize_teardown do |worker|
    #     SimpleCov.result
    #   end
    # end

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
