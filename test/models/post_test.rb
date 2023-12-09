# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test 'should not save post without title' do
  #   post = Post.new
  #   assert_not post.save, 'Saved the post without a title'
  # end

  # test 'should save post with title' do
  #   post = Post.new(title: 'Title')
  #   assert post.save, 'Saved the post with a title'
  # end

  # test 'should not save post without user' do
  #   post = Post.new(title: 'Title')
  #   assert post.save, 'Saved the post with a title'
  # end

  # test 'should save post with user' do
  #   post = Post.new(title: 'Title', user: users(:one))
  #   assert post.save, 'Saved the post with a title'
  # end

  # test 'should destroy reactions when post is destroyed' do
  #   post = posts(:one)
  #   assert_difference 'Reaction.count', -1 do
  #     post.destroy
  #   end
  # end

  # test 'should not destroy user when post is destroyed' do
  #   post = posts(:one)
  #   assert_no_difference 'User.count' do
  #     post.destroy
  #   end
  # end
end
