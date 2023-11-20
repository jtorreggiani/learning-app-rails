# frozen_string_literal: true

class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :post

  enum reaction_type: { thumbs_up: 0, thumbs_down: 1, heart: 2, clap: 3 }

  # Validates the reaction_type is present and is one of the enum values
  validates :reaction_type, presence: true, inclusion: { in: reaction_types.keys }
end
