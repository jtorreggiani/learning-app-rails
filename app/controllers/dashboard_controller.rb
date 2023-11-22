# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user = current_user
    @posts = Post.limit(10).order(created_at: :desc).includes(:user, :reactions)
    @post = Post.new
  end
end
