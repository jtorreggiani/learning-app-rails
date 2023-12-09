# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text
#  name       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
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
