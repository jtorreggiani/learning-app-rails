# frozen_string_literal: true

# Represents a basic post. This model is really
# simple and only has a title and content.
class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reactions, dependent: :destroy

  validates :title, presence: true
end
