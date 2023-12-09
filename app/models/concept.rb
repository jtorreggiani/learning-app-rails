# frozen_string_literal: true

# == Schema Information
#
# Table name: concepts
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Concept < ApplicationRecord
  validates :name, presence: true
end
