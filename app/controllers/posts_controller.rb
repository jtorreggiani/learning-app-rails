# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # Renders list of posts
  # GET /posts
  # GET /posts.json
  # GET /posts.turbo_stream
  # @pagy [Pagy] pagination object
  # @posts [Array<Post>] all posts
  def index
    @pagy, @posts = pagy_countless(Post.order(created_at: :desc), items: 10)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  # GET /posts/1 or /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        successful_response(format)
      else
        failed_response(format)
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:name, :title, :content)
  end

  def successful_response(format)
    format.turbo_stream

    format.html do
      redirect_to post_url(@post), notice: 'Post was successfully created.'
    end

    format.json do
      render :show, status: :created, location: @post
    end
  end

  def failed_response(format)
    format.turbo_stream do
      render turbo_stream: turbo_stream.replace(
        @post,
        partial: 'posts/form',
        locals: { post: @post }
      )
    end
    format.html { render :new, status: :unprocessable_entity }
    format.json { render json: @post.errors, status: :unprocessable_entity }
  end
end
