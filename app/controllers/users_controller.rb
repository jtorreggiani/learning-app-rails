# frozen_string_literal: true

class UsersController < ApplicationController
  # Renders the users page
  # @users [Array<User>] all users
  def index
    @users = User.all
  end

  # Renders the profile page
  # @user [User] the user
  # @post [Post] a new post
  def profile
    @user = User.find_by(id: params[:id])
    @post = Post.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :headline, :avatar)
  end
end
