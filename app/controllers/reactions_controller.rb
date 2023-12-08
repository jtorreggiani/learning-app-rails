# frozen_string_literal: true

class ReactionsController < ApplicationController
  before_action :set_post, only: %i[create]
  before_action :set_reaction, only: %i[create]

  # Creates a new reaction for a post
  # POST /posts/:post_id/reactions
  # POST /posts/:post_id/reactions.json
  # POST /posts/:post_id/reactions.turbo_stream
  def create
    if @reaction.save
      handle_successful_reaction
    else
      handle_failed_reaction
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_reaction
    @reaction = @post.reactions.new
    @reaction.assign_attributes(
      reaction_type: reaction_params[:reaction_type],
      user: current_user,
    )
  rescue ArgumentError
    @reaction.errors.add(:reaction_type, 'is not a valid reaction type')
  end

  def handle_successful_reaction
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post }
      format.json { render json: @reaction, status: :created }
    end
  end

  def handle_failed_reaction
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(@reaction, partial: 'reactions/reactions', locals: { post: @post })
      end
      format.html { redirect_to @post }
      format.json { render json: @reaction.errors, status: :unprocessable_entity }
    end
  end

  def reaction_params
    params.permit(:reaction_type)
  end
end
