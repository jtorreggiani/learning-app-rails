# frozen_string_literal: true

class ReactionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one) # Assuming you have fixtures set up for users
    @post = posts(:one) # Assuming you have fixtures for posts
    sign_in @user # If you're using Devise for authentication
  end

  test 'should create reaction with turbo stream' do
    assert_difference('Reaction.count') do
      post post_reactions_path(@post), params: { reaction_type: 'thumbs_up' }, as: :turbo_stream
    end

    assert_response :success
    assert_match(/turbo-stream/, @response.body)
  end

  test 'should handle failed reaction creation with turbo stream' do
    # Assuming there's some validation in Reaction model that can cause failure
    # For example, let's say a reaction can't be 'dislike' for this test
    assert_no_difference('Reaction.count') do
      post post_reactions_path(@post), params: { reaction_type: 'dislike' }, as: :turbo_stream
    end

    assert_response :success
    assert_match(/turbo-stream/, @response.body)
  end
end
