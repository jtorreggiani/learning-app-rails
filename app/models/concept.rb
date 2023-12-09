# frozen_string_literal: true

class Concept < ApplicationRecord
  validates :name, presence: true
end
