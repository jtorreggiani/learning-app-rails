# frozen_string_literal: true

if Rails.env.test? && ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start 'rails' do
    enable_coverage :branch
    minimum_coverage line: 100, branch: 100
    add_filter '/test/'
    add_filter '/config/'
    add_filter '/app/channels/'
    add_filter '/app/jobs/'
    add_filter '/app/mailers/'
  end
end
