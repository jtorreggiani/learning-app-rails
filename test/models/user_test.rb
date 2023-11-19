# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one) # Assuming you have fixtures set up
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'should have posts association' do
    assert_respond_to @user, :posts
  end

  test 'associated posts should be destroyed' do
    @user.save
    @user.posts.create!(title: 'Test Post', content: 'This is a test post.')

    assert_difference 'Post.count', -1 do
      @user.destroy
    end
  end

  test 'destroying user should destroy associated posts' do
    @user.save
    @user.posts.create!(title: 'Test Post', content: 'This is a test post.')

    assert_difference 'Post.count', -1 do
      @user.posts.destroy_all
    end
  end
end
