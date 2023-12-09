# frozen_string_literal: true

require 'test_helper'

class ReactionsHelperTest < ActionView::TestCase
  test 'reaction_emoji' do
    assert_equal '👍', reaction_emoji('thumbs_up')
    assert_equal '👎', reaction_emoji('thumbs_down')
    assert_equal '❤️', reaction_emoji('heart')
    assert_equal '👏', reaction_emoji('clap')
    assert_equal '', reaction_emoji('invalid')
  end
end
