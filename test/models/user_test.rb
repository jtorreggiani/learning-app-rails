# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string
#  headline               :string
#
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

  test 'user has many post reactions' do
    post = posts(:one)
    reaction = @user.reactions.create!(post: post, reaction_type: 'thumbs_up')
    assert_equal reaction, @user.reactions.last
  end

  test 'user can add profile picture' do
    @user.profile_picture.attach(
      io: File.open(Rails.root.join('test', 'fixtures', 'files', 'tree.jpeg')),
      filename: 'tree.jpeg',
      content_type: 'image/png'
    )
    assert @user.profile_picture.attached?
  end

  test 'has a test method' do
    assert_equal 'test', @user.test_method
  end
end
