# frozen_string_literal: true

json.extract! concept, :id, :name, :description, :created_at, :updated_at
json.url concept_url(concept, format: :json)
