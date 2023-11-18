class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user = current_user
    @posts = Post.all
    @post = Post.new
  end
end
