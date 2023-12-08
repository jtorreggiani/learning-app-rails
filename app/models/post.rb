# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  name       :string
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Represents a basic post. This model is really
# simple and only has a title and content.
class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reactions, dependent: :destroy

  validates :title, presence: true
end
