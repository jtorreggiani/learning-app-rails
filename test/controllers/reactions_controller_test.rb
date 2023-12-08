# frozen_string_literal: true

class ReactionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @post = posts(:one)
    sign_in(@user)
  end

  test 'should create reaction with turbo stream' do
    assert_difference 'Reaction.count' do
      post post_reactions_path(@post), params: { reaction_type: 'thumbs_up' }, as: :turbo_stream
    end
    assert_response :success
    assert_match(/turbo-stream/, @response.body)
  end

  test 'should handle failed reaction creation with turbo stream' do
    assert_no_difference 'Reaction.count' do
      post post_reactions_path(@post), params: { reaction_type: 'dislike' }, as: :turbo_stream
    end
    assert_response :success
    # assert_match /turbo-stream/, @response.body
  end

  test 'should create reaction with html' do
    assert_difference 'Reaction.count' do
      post post_reactions_path(@post), params: { reaction_type: 'thumbs_up' }
    end
    assert_redirected_to @post
  end

  test 'should handle failed reaction creation with html' do
    assert_no_difference 'Reaction.count' do
      post post_reactions_path(@post), params: { reaction_type: 'dislike' }
    end
    assert_redirected_to @post
  end

  test 'should create reaction with json' do
    assert_difference 'Reaction.count' do
      post post_reactions_path(@post), params: { reaction_type: 'thumbs_up' }, as: :json
    end
    assert_response :created
  end

  test 'should handle failed reaction creation with json' do
    assert_no_difference 'Reaction.count' do
      post post_reactions_path(@post), params: { reaction_type: 'dislike' }, as: :json
    end
    assert_response :unprocessable_entity
  end
end
