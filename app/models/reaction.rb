# frozen_string_literal: true

# == Schema Information
#
# Table name: reactions
#
#  id            :bigint           not null, primary key
#  user_id       :bigint           not null
#  post_id       :bigint           not null
#  reaction_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Represents a simple reaction to a post.
class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :post

  enum reaction_type: { thumbs_up: 0, thumbs_down: 1, heart: 2, clap: 3 }

  # Validates the reaction_type is present and is one of the enum values
  validates :reaction_type, presence: true, inclusion: { in: reaction_types.keys }
end
