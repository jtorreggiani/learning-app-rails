# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reactions, dependent: :destroy

  validates :title, presence: true
end
