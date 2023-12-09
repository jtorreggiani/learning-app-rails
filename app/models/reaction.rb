# frozen_string_literal: true

# == Schema Information
#
# Table name: reactions
#
#  id            :bigint           not null, primary key
#  reaction_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  post_id       :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_reactions_on_post_id  (post_id)
#  index_reactions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :post

  enum reaction_type: { thumbs_up: 0, thumbs_down: 1, heart: 2, clap: 3 }

  # Validates the reaction_type is present and is one of the enum values
  validates :reaction_type, presence: true, inclusion: { in: reaction_types.keys }
end
