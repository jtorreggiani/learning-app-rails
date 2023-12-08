# frozen_string_literal: true

# This controller is responsible for rendering the dashboard page.
# It currently renders the 10 most recent posts and a form to create a new post.
class DashboardController < ApplicationController
  before_action :authenticate_user!

  # Renders the dashboard page
  # @current_user [User] the current user
  # @posts [Array<Post>] the 10 most recent posts
  # @post [Post] a new post
  def index
    @current_user = current_user
    @posts = Post.limit(10).order(created_at: :desc).includes(:user, :reactions)
    @post = Post.new
  end
end
