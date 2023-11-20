class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def profile
    @user = User.find_by(id: params[:id])
    @post = Post.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :headline, :avatar)
  end
end
