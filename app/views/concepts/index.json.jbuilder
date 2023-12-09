# frozen_string_literal: true

json.array! @concepts, partial: 'concepts/concept', as: :concept
