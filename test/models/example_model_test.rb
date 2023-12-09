# frozen_string_literal: true

require 'test_helper'

class ExampleModelTest < ActiveSupport::TestCase
  test 'responds to test method' do
    assert_equal ExampleModel.test_method, 'test'
  end
end
