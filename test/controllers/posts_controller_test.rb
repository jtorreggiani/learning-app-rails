# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test 'should get index' do
    get posts_url
    assert_match @post.title, response.body
    assert_match @post.content, response.body
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      post posts_url, params: { post: { content: @post.content, name: @post.name, title: @post.title } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test 'should show post' do
    get post_url(@post)
    assert_match @post.title, response.body
    assert_match @post.content, response.body
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    patch post_url(@post), params: { post: { content: @post.content, name: @post.name, title: @post.title } }
    assert_redirected_to post_url(@post)
  end

  test 'should redirect to edit for invalid post' do
    patch post_url(@post), params: {
      post: {
        content: @post.content,
        name: @post.name,
        title: nil,
      },
    }
    assert_response :unprocessable_entity
    assert_match 'Title can&#39;t be blank', response.body
    assert_match 'Editing post', response.body
  end

  test 'should update post via JSON' do
    patch post_url(@post, format: :json), params: {
      post: {
        content: @post.content,
        name: @post.name,
        title: @post.title
      }
    }
    assert_response :success
  end

  test 'should handle turbo stream' do
    post posts_url(format: :turbo_stream), params: {
      post: {
        content: 'Content',
        title: 'Title',
      }
    }
    assert_response :success
  end

  test 'should handle errors via JSON' do
    patch post_url(@post, format: :json), params: {
      post: {
        content: @post.content,
        name: @post.name,
        title: nil,
      }
    }
    assert_response :unprocessable_entity
    assert_match 'can\'t be blank', JSON.parse(response.body)['title'][0]
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
