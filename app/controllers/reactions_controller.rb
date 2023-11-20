# frozen_string_literal: true

class ReactionsController < ApplicationController
  before_action :set_post

  def create
    @reaction = build_reaction

    if @reaction.save
      handle_successful_reaction
    else
      handle_failed_reaction
    end
  rescue ArgumentError => e
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(@reaction, partial: 'reactions/reactions', locals: { post: @post })
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def build_reaction
    @post.reactions.new(reaction_params.merge(user: current_user))
  end

  def handle_successful_reaction
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post }
    end
  end

  def handle_failed_reaction
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(@reaction, partial: 'reactions/reactions', locals: { post: @post })
      end
    end
  end

  def reaction_params
    params.permit(:reaction_type)
  end
end
